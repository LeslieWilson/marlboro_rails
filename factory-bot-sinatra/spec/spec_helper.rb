ENV["RACK_ENV"] = "test"
require "rack/test"
require "rspec"
require "factory_bot"
require_relative 'support/database_cleaner'
require_relative '../server'

set :environment, :test
set :database, :test

require File.expand_path "../../server.rb", __FILE__
Dir[File.join(File.dirname(__FILE__), "factories", "*.rb")].sort.each { |f| require f }

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure do |config|
  config.include RSpecMixin
  # config.include FactoryBot::Syntax::Methods
end
