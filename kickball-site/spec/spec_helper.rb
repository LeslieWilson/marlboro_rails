require "rspec"
require "capybara"
require "capybara/rspec"

require_relative "../server"

Capybara.app = Sinatra::Application
