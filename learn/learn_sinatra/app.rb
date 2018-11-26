require 'sinatra/base'

module DemoApp
    Class Web < Sinatra::Base
        get '/' do
            "test"
        end
    end
