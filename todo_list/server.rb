
require "sinatra"
require "pry"
get "/items" do
  @items = ["00786", "88693", "66793", '77385']
  erb :index
end
get "/items/:item_name" do
  @item_name = params[:item_name]
  erb :show
end

post "/items" do
binding.pry
item = params["item_name"]
File.open("items.txt", "a") do |file|
    file.puts(item)
end
redirect "/items"
end
