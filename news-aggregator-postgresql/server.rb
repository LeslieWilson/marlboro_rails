require "sinatra"
require "pg"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require_relative "./app/models/article"
require 'csv'


set :bind, '0.0.0.0'


set :views, File.join(File.dirname(__FILE__), "app", "views")

configure :development do
  set :db_config, { dbname: "news_aggregator_development" }
end

configure :test do
  set :db_config, { dbname: "news_aggregator_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end


get "/index" do
@articles = []
articles = nil

db_connection do |conn|
  articles = conn.exec("SELECT name FROM ")
end

articles.to_a.each do |article|
@articles << [article.name]
end
erb :index
end



get "/index/new" do
erb :new
end

post "/new" do
article_name = params["article_name"]
article_description = params["article_description"]
if article_description == 'hello'

@error = 'err'
erb :new

else
CSV.open("myfile.csv", "a") do |csv|
csv << ["title:" + article_name,"description:" + article_description ]

end
redirect  "/index"
end

end
