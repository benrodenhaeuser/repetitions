require 'sinatra'
require 'sinatra/reloader'
require "sinatra/content_for"
require 'redcarpet'
require 'yaml'

configure do
  enable :sessions
  set :session_secret, "secret"
end

# ------------------------------------------------------------------
# helpers
# ------------------------------------------------------------------

def data_path
  root = File.expand_path('..', __FILE__)

  if ENV["RACK_ENV"] == "test"
    root + '/test/data'
  else
    root + '/data'
  end
end

def path_to_file(filename)
  File.join(data_path, filename)
end

def file_list
  pattern = File.join(data_path, '*')
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
    erb(render_markdown(content))
  end
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

get '/new' do
  erb(:new)
end

get '/sign-in' do
  erb(:sign_in)
end

post '/sign-in' do
  username = params[:username]
  password = params[:password]

  users = YAML.load(File.read('./users/users.yml'))

  if users[username] == password
    session[:message] = 'Welcome!'
    session[:user] = username
    redirect '/index'
  else
    session[:message] = 'Invalid credentials!'
    erb(:sign_in)
  end
end

post '/sign-out' do
  session.delete(:user)
  session[:message] = 'Goodbye!'
  redirect '/index'
end

post '/create' do
  filename = params[:filename]
  path = path_to_file(filename)
  File.write(path, '')

  session[:message] = "The document #{filename} has been created."
  redirect '/index'
end

post '/:filename/delete' do
  filename = params[:filename]
  path = path_to_file(filename)
  File.delete(path)

  session[:message] = "The document '#{filename}' has been deleted"
  redirect '/index'
end

get '/:filename' do
  filename = params[:filename]
  path = path_to_file(filename)

  if File.exist?(path)
    render_content(path)
  else
    session[:message] = "The file #{filename} does not exist."
    redirect '/index'
  end
end

get '/edit/:filename' do
  @filename = params[:filename]
  @file = File.read(path_to_file(@filename))
  erb(:edit_document)
end

post '/:filename' do
  path = path_to_file(params[:filename])
  File.write(path, params[:file_content])
  session[:message] = 'The file has been updated.'
  redirect '/index'
end
