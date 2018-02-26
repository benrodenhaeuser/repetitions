require 'sinatra'
require 'sinatra/reloader'
require "sinatra/content_for"

def file_list
  root = File.expand_path('..', __FILE__)
  pattern = root + '/data/*'
  Dir.glob(pattern).map { |file| File.basename(file) }
end

get '/' do
  redirect 'index'
end

get '/index' do
  @files = file_list
  erb(:index)
end
