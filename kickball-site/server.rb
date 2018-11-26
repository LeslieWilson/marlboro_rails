require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require_relative "models/league"


set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
erb :home
end


get "/teams" do
    @teams = League::ROSTER
    erb :teams
end


get "/teams/:team_name" do
    @team = params[:team_name]
    @everything = League::ROSTER
    @player_names  = @everything[@team]
    erb :players_show
end
