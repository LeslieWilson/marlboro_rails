require "net/http"
require "uri"

messages_url = "http://localhost:4567/messages"
uri = URI.parse(messages_url)           # convert the URL string to a URI object
response = Net::HTTP.get_response(uri)  # issue a HTTP GET request
puts response.body
