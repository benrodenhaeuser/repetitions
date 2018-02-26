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

  def test_a_document
    get '/about.txt'

    assert_equal 200, last_response.status
    assert_equal 'text/plain', last_response['Content-Type']
    assert_includes last_response.body, 'some content'
  end
end
