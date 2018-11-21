require "sinatra"

set :bind, '0.0.0.0'
set :public_folder, File.join(File.dirname(__FILE__), "public")

get "/hello" do
    "<p>hello! the current time is #{Time.now}</p>"
end

get "/tasks" do
    '''
  <!DOCTYPE html>
  <html>
    <head>
      <title>Basic HTML Page</title>
      <link rel="stylesheet" href="home.css">
    </head>

    <body>
      <h1>TODO list</h1>

      <ul>
        <li>pay bills</li>
        <li>go dancing</li>
        <li>buy milk</li>
        <li>learn Ruby</li>
      </ul>
    </body>
  </html>
  '''
end
