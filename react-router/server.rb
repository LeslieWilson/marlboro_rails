require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/json"
require "json"
require "pry" if development? || test?

set :bind, '0.0.0.0'

def cereal_array
  cereal = File.read('./data/cereal.json')
  JSON.parse(cereal)
end

def selected_cereal(id, cereals)
  selected_cereal = cereals.find { |cereal| cereal["id"] == id }
end

get '/' do
  erb :home
end

get '/cereals/:id' do
  erb :home
end

get '/api/v1/cereals' do
  json cereal_array
end

get '/api/v1/cereals/:id' do
  selected_cereal_id = params[:id].to_i
  json selected_cereal(selected_cereal_id, cereal_array)
end

get '*' do
  erb :home
end
