require 'sinatra'
require "pry" if development? || test?
require "sinatra/reloader" if development?
set :bind, '0.0.0.0'
get '/' do
  @ingredients = File.readlines("ingredients.txt")
  erb :index
end
get "/:whatever" do
    @ingredient_name = params[:whatever]
erb :show
end
post "/ingredients" do
  ingredient = params["ingredient_name"]
  File.open("ingredients.txt", 'a') do |file|
    file.puts(ingredient)
  end
  redirect '/'
end
