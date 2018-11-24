require "erb"

name = "Dan"
message = "hello, <%= name %>."
erb = ERB.new(message)

puts erb.result
