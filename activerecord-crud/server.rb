require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require "sinatra/reloader" if development?
require "pry" if development? || test?
require 'faker'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
  @title = "Hello World"
  erb :index
end
