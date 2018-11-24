require "erb"

name = "Dan"
message = "Hello, <%= name %>."
erb = ERB.new(message)

puts erb.result  # => "Hello, Dan."
