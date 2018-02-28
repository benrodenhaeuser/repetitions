ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"
require "erb"
require "fileutils"

require_relative "../app"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)

    create_document('about.txt', 'some content')
    create_document('test.md', '# headline')
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def create_document(name, content = "")
   File.open(File.join(data_path, name), "w") do |file|
     file.write(content)
   end
  end

  def session
    last_request.env["rack.session"]
  end

  def admin_session
    { "rack.session" => { username: "admin" } }
  end

  # USE LIKE THIS:
  # def test_editing_document
  #   get "/changes.txt/edit", {}, admin_session
  #   assert_equal 200, last_response.status
  # end

  def test_root
    get '/'

    assert_equal 302, last_response.status
    get last_response['Location']
    assert_equal 200, last_response.status
    assert_includes last_response.body, '<ul>'
  end

  def test_index
    get '/index'

    assert_equal 200, last_response.status
    assert_includes last_response.body, '<ul>'
  end

  def test_show_a_document
    get '/about.txt'

    assert_equal 200, last_response.status
    assert_equal 'text/plain', last_response['Content-Type']
    assert_includes last_response.body, 'some content'
  end

  def test_create_document
    post '/create', { filename: 'second_about.txt' }, admin_session
    assert_equal 302, last_response.status
    assert_equal "The document 'second_about.txt' has been created.", session["message"]
    get last_response['Location']
    assert_includes last_response.body, 'second_about.txt'
  end

  def test_delete_document
    post '/about.txt/delete', {}, admin_session
    assert_equal 302, last_response.status
    assert_equal "The document 'about.txt' has been deleted", session[:message]
    get last_response['Location']
    assert_includes last_response.body, '>test.md'
    refute_includes last_response.body, '>about.txt'
  end

  def test_sign_in_form
    get '/sign-in'
    assert_equal 200, last_response.status
    assert_includes last_response.body, '<form'
    assert_includes last_response.body, '<input'
  end

  def test_sign_in_form_submission
    post '/sign-in', { username: 'admin', password: 'secret' }
    assert_equal 302, last_response.status
    assert_equal 'Welcome!', session[:message]
    assert_equal 'admin', session[:user]
    get last_response['Location']
    assert_includes last_response.body, 'Signed in as admin'
  end

  def test_invalid_credentials
    post '/sign-in', { username: 'admin', password: 'something stupid' }
    assert_equal 422, last_response.status
    assert_nil session[:username]
    assert_includes last_response.body, '<form'
    assert_includes last_response.body, 'Invalid credentials'
  end

  def test_sign_in_sign_out
    post '/sign-in', { username: 'admin', password: 'secret' }
    post '/sign-out'
    assert_equal 302, last_response.status
    assert_nil session[:username]
    assert_equal 'Goodbye!', session[:message]
    get last_response['Location']
    assert_includes last_response.body, 'Sign in'
  end

  def test_delete_document_while_signed_out
    post '/about.txt/delete', {}
    assert_equal 302, last_response.status
    assert_equal "You have to be signed in to do that.", session[:message]
  end
  # ^ should write analogous tests for editing document (get and post), creating document (get and post)
end
