require 'sinatra'
require 'sinatra/reloader'
require "sinatra/content_for"
require 'redcarpet'

# ------------------------------------------------------------------
# helpers
# ------------------------------------------------------------------

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

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def render_content(path_to_file)
  content = File.read(path_to_file)
  if File.extname(path_to_file) == '.txt'
    headers['Content-Type'] = 'text/plain'
    content
  elsif File.extname(path_to_file) == '.md'
    render_markdown(content)
  end
end

configure do
  enable :sessions
  set :session_secret, "secret"
end

# ------------------------------------------------------------------
# routes
# ------------------------------------------------------------------

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
    render_content(path_to_file)
  else
    session[:message] = "The file #{params[:filename]} does not exist."
    redirect '/index'
  end
end

get '/edit/:filename' do
  @filename = params[:filename]
  @file = File.read(data_path + '/' + @filename)
  erb(:edit_document)
end

post '/:filename' do
  path_to_file = data_path + '/' + params[:filename]
  File.write(path_to_file, params[:file_content])
  session[:message] = 'The file has been updated.'
  redirect '/index'
end
