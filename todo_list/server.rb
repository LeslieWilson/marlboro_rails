
require "sinatra"

get "/questions" do
  @questions = ["why am i so stupid", "got milk", "hows my gfs ass so nice", 'what year is it']
  erb :index
end


get "/questions/:question_name" do
  @question_name = params[:question_name]
  erb :show
end
