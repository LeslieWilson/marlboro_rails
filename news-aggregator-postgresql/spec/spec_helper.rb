ENV["RACK_ENV"] ||= "test"
require 'rspec'
require 'capybara/rspec'
require 'pry'
require_relative '../server'
require_relative '../app/models/article'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before(:each) do
    database = Sinatra::Application.db_config[:dbname]
    system("dropdb #{database} 2>&1 > /dev/null")
    system("createdb #{database} 2>&1 > /dev/null")
    system("psql #{database} < schema.sql >> /dev/null 2>&1")
  end
end
