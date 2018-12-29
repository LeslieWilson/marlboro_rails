require "sinatra"

require "sinatra/reloader" if development?
require "pry" if development? || test?
require 'csv'

set :bind, '0.0.0.0'

get "/" do
    redirect "/list"
end

get "/list" do
    @list = []
    CSV.foreach("grocery_list.csv",headers:true) do |item|
        @list << item["name"]

end
erb :list
end

post "/list" do
    if params[:item_name].empty? == true
        erb :error
    else
    @item_name = params[:item_name]


CSV.open("grocery_list.csv", "a") do |csv|
    csv << [@item_name]
end
redirect  "/"
end

end
