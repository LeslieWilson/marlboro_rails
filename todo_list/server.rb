
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
binding.pry
post "/items" do
redirect "/items"
end


#erb links you to something in the views folder
