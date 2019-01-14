require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require "sinatra/reloader" if development?
require "pry" if development? || test?

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

set :views, 'app/views'

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
    @contacts = Contact.all
  erb :index
end


get '/:id' do

    @contacts = Contact.all
    @person = @contacts.find(params['id'])

    erb :show
end
