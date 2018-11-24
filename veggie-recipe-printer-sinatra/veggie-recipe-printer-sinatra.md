## The Amazing Vegetarian Recipe Printer!

### Instructions

Write a Sinatra app that prints out recipes in a particular format using Ruby and [Embedded Ruby](http://ruby-doc.org/stdlib-2.2.0/libdoc/erb/rdoc/ERB.html) (or `erb`)!


### ERB in the Command Line

ERB is Embedded Ruby!

ERB allows us to embed Ruby code into strings or documents. This means we can use `erb` in both the command line and in our Sinatra applications!

Let's take a look at an example of using `erb` in the command line. The `example.rb` file has the following code:

```ruby
require "erb"

name = "Dan"
message = "Hello, <%= name %>."
erb = ERB.new(message)

puts erb.result  # => "Hello, Dan."
```

A lot of this probably looks familiar. We're assigning the string "Dan" to our `name` variable. Then we're creating a `message` variable that greets the person whose name is saved in our `name` variable. When we create a new instance of the `ERB` class (which ruby gives us for free), and pass in our `message` as an argument, we can now print our message to the console. Running `ruby example.rb` in our terminal should output "Hello, Dan." to the console. Try putting your name into the `name` variable and running it again.

### ERB in the Wild

You might remember from our To Do list, we used `erb` to dynamically print our `tasks` array to our Sinatra `view`. Let's take a look at our `server.rb`.

You can see that we're defining the variable `recipe` as a hash of all of the information we need about this brussels sprouts dish.

We're then defining a route (`get '/'`) that is saving the various parts of that hash to instance variables, and telling Sinatra to render the ERB template named `index` (which lives in our `views` directory). Since our `index.erb` file can read ruby, that means we should be able to access  our instance variables in our `erb` file! Put the following at the top of your `index.erb` file:

```ruby
<% require 'pry' %>
<% binding.pry %>

```

When you start your server by running `ruby server.rb` and navigate to `localhost:4567`, you should hit a `pry` in your terminal. You should now be able to see your `@name`, `@ingredients`, and `@directions` instance variables in the view!

### Your job

Now that we know we can access our instance variables in our `index.erb`, let's use ERB syntax to actually display the information on our webpage! Make the following:

* An `h1` with the recipe name
* An unordered list of all the ingredients we need
* An ordered list of the directions

#### Tips
* Remember that we use empty erb tags (`<% %>`) for code that should be evaluated, but *not* displayed on the page.
* We use erb tags with an `=` sign (`<%= %>`) for code that *should* display on the page.
* We can put a `pry` in *both* our `server.rb` and `index.erb` files to make sure we are receiving and displaying the correct information.

### Extra Challenge
We want our visitors to be able to leave reviews to tell us what they think about our brussels sprouts!

* Create a variable under `recipe` called `reviews`. Set `reviews` equal to an array of individual review hashes. Each hash should have a `username`, a `rating` between 1-5, and a `review`.
* Create an instance variable to pass our `review` down to our route.
* Add a `Reviews:` section in our `index.erb`. Iterate over your `reviews` instance variable to print the reviewee's name, rating, and review to the page!
