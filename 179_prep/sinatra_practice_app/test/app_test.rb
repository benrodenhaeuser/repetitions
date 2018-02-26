ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"
require "erb"

require_relative "../app"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_hello_world
    get '/'
    assert_equal 200, last_response.status
    assert_includes last_response.body, 'hello world'
  end

  def test_hello_from_erb
    get '/erb'
    assert_equal 200, last_response.status
    assert_includes last_response.body, '<h1>hello'
  end

end
