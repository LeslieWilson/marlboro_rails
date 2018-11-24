require "net/http"
require "active_support/core_ext/hash"
require "pp"

weather_url = "https://forecast.weather.gov/MapClick.php?lat=42.35&lon=-71.06&FcstType=dwml"
uri = URI.parse(weather_url)
response = Net::HTTP.get_response(uri)
body = Hash.from_xml(response.body)

pp body
