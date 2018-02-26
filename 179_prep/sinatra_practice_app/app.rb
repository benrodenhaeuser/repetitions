require 'sinatra'
require 'sinatra/reloader'
require "sinatra/content_for"
require 'redcarpet'

configure do
  enable :sessions
  set :session_secret, "secret"
end

def data_path
  root = File.expand_path('..', __FILE__)

  if ENV["RACK_ENV"] == "test"
    root + '/test/data'
  else
    root = File.expand_path('..', __FILE__)
    root + '/data'
  end
end

def file_list
  pattern = data_path + '/*'
  Dir.glob(pattern).map { |file| File.basename(file) }
end

get '/' do
  redirect 'index'
end

get '/index' do
  @files = file_list
  erb(:index)
end

get '/:filename' do
  path_to_file = data_path + '/' + params[:filename]
  if File.exist?(path_to_file)
    headers['Content-Type'] = 'text/plain'
    File.read(path_to_file)
  else
    session[:message] = "The file #{params[:filename]} does not exist."
    redirect '/index'
  end
end

# markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
# markdown.render("# This will be a headline!")
