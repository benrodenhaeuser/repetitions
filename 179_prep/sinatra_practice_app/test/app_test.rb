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
end
