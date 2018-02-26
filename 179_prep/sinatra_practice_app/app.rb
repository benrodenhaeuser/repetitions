require 'sinatra'

get '/' do
  'hello world'
end

get '/erb' do
  erb(:test_view)
end
