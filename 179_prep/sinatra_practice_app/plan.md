# Set up Sinatra "Hello world" project with tests

1. prepare a Gemfile (gem source, ruby version, dependencies)
  - the dependencies are:
    - gem 'sinatra'
    - gem 'minitest'
    - gem 'rack-test' (with a hyphen)
2. switch to correct local ruby version (as indicated by Gemfile) if necessary
3. run bundle install
4. set up hello world app
    - require sinatra
    - define a route
5. set up test suite
  - require the app file as a relative
  - require `rack/test` (with a slash)
  - in the test class:
    - `include Rack::Test::Methods`
    - define an `app` method pointing to `Sinatra::Application`
6. make a views directory and test whether templating works
