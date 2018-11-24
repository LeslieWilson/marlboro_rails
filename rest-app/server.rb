require "sinatra"

require "sinatra/reloader" if development?
require "pry" if development? || test?

set :bind, '0.0.0.0'  # bind to all interfaces

MESSAGES = "messages.txt"

def messages
  result = File.readlines(MESSAGES)
  result
end

get "/" do
  redirect to("/messages")
end

# Create a new Message
post "/messages" do
  if params["message"] && params["message"] != ""
    File.open(MESSAGES, "a") { |file| file.puts params["message"] }
    status 201
    body "Created"
  else
    status 404
    body "Not Found"
  end
end

# Read all the messages
get "/messages" do
  messages.map { |message| "<br/>#{message}" }
end

# Read a particular message
get "/messages/:id" do
  index = params["id"].to_i - 1
  if index >= 0
    return messages[index]
  else
    status 404
    body "Not Found"
  end
end

# Update a message
patch "/messages/:id" do
  index = params["id"].to_i - 1
  if index >= 0
    new_messages = messages
    new_messages[index] = params["message"]
    File.open(MESSAGES, "w") do |file|
      new_messages.each { |message| file.puts message }
    end
    status 200
    body "OK"
  else
    status 404
    body "Not Found"
  end
end

# Delete a message
delete "/messages/:id" do
  index = params["id"].to_i - 1
  if index >= 0
    new_messages = messages
    File.open(MESSAGES, "w") do |file|
      new_messages.each_with_index do |message, i|
        if index != i
          file.puts message
        else
          file.puts
        end
      end
    end
    status 200
    body "OK"
  else
    status 404
    body "Not Found"
  end
end
