
require "sinatra"
require "pry"

get "/items" do
    @items = File.readlines("items.txt")
    erb :index
end

get "/items/:thirty" do
  @item_name = params[:thirty]
  erb :show
end

post "/items" do
item = params["item_name"]
File.open("items.txt", 'a') do |file|
    file.puts(item)
end
redirect "/items"
end
