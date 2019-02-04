class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  
  protect_from_forgery unless: -> { request.format.json? }
end
