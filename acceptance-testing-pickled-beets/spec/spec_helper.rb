require 'pry'
require 'rspec'
require "capybara/rspec"

ENV["RACK_ENV"] ||= "test"
require_relative '../server.rb'

set :environment, :test

Capybara.app = Sinatra::Application
