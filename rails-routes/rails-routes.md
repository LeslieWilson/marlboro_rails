In this article we will explore the Rails router which defines the endpoints for our application.

### Learning Goals

* Examine default routes via `rake routes`
* Create a route manually for a resource
* Incorporate **rake routes** to correlate named routes, URLs, and controller-action pairs
* Connect resources in `config/routes.rb` to their corresponding controllers
* Understand the HTTP methods and how they correlate to Rails RESTful actions
* Examine named routes and incorporate **path helpers**: `*_path`
* Begin incorporating view helper methods with `link_to`

### Rails Router

If we think of the MVC stack like a workplace where each department has its own specific function, we can think of the Rails router like workers in the mailroom. They take requests in and direct them to their desired destination. The Rails router is responsible for taking an HTTP request and forwarding it to its intended destination - a controller action.

With previous layers of the stack, we had many different files to work with. Fortunately, in the context of our routes, we only have a single file to deal with, located at `config/routes.rb`. We'll explore routes using the [EventTracker application](https://github.com/launchacademy/event_tracker) which can be set up with the following commands:

```no-highlight
et get rails-routes
cd rails-routes
bundle
bundle exec rake db:setup
```

### Sinatra Routes vs. Rails Routes

You may recall that in our Sinatra apps, we specified our routes in our `server.rb` file:

```ruby
# sets a route for GET '/events'
get '/events' do
  @events = Event.all
  erb :index
end
```

In a Rails app, the routes live in `config/routes.rb`, and the corresponding controller action  would look like this:

```ruby
# app/controllers/events_controller.rb

# does not set the route, though
# this action will be triggered by
# GET '/events' as well
def index
  @events = Event.all
end
```

As stated above, in Rails, our controller does *not* specify the routes associated with each action. Instead, those routes are specified in `config/routes.rb` and Rails makes some assumptions about which controller action each route maps to.

### Default Routes

To understand how Rails correlates each route with a controller action, let's return to our Event Tracker application.

If we open our `config/routes.rb` file, we should see the following:

```ruby
# config/routes.rb

Rails.application.routes.draw do
  resources :events
end
```

That one line of code, `resources :events`, provides us with routes for all seven of the CRUD actions in our `EventsController`. `resources` is a helper method provided by Rails that helps us to avoid having to manually specify each of these routes individually.

Thanks to the Rakefile given to us by Rails, we have access to the command `rake routes`.  `rake routes` will show us a list of all the routes available to us, based on what we have in our `routes.rb`.  Running `rake routes` in our terminal will give us:

```no-highlight
    Prefix Verb   URI Pattern                Controller#Action
    events GET    /events(.:format)          events#index
           POST   /events(.:format)          events#create
 new_event GET    /events/new(.:format)      events#new
edit_event GET    /events/:id/edit(.:format) events#edit
     event GET    /events/:id(.:format)      events#show
           PATCH  /events/:id(.:format)      events#update
           PUT    /events/:id(.:format)      events#update
           DELETE /events/:id(.:format)      events#destroy
```

Let's focus on the `Verb` and `URI Pattern` columns. Here, you can see that we've got all the combinations of HTTP verbs and relative paths we need to trigger each of our CRUD actions.

The `Controller#Action` column helpfully shows us which action that HTTP request will trigger. We can see, for example, that:

* A `GET /events` request will trigger the `EventsController#index` action
* A `POST /events` request will trigger the `EventsController#create` action
* A `PATCH /events/:id` or `PUT /events/:id` request will trigger the `EventsController#update` action

### Restricting Routes

Like many aspects of Rails, the resources invocation follows convention over configuration. However, we can override Rails' assumptions to fit our needs.

Specifying `resources :events` will generate all seven CRUD actions. In some cases we don't want all of the CRUD actions to be available so we can use the keywords **only** and **except** to prevent Rails from generating routes for certain controller actions.

Say we don't want to allow users to create, edit, or delete events.  All they can do is view events or a particular event's page. We could delete all actions except `index` and `show` from our `EventsController`, and modify our `routes.rb` file to only include routes for those two actions:

```ruby
# config/routes.rb

Rails.application.routes.draw do
  resources :events, only: [:index, :show]
end
```

Now say we want to allow users to add and edit events, but not to delete them. We'd add back our `new`, `edit`, `create` and `update` actions, and update our `resources` invocation as follows:

```ruby
# config/routes.rb

Rails.application.routes.draw do
  resources :events, except: [:destroy]
end
```

### Root Path

It is often important to specify what controller action is hit when a user navigates to your **root**. This is what action will be hit when your user navigates to `/`. We can specify the action in the format of `controller#action`. For example, if we want our root path to display a list of events we could send them to the `index` action of the `EventsController`:

```ruby
# config/routes.rb

Rails.application.routes.draw do
  root "events#index"
  ...
end
```

### RESTful Actions

It is important to review how our resources map to RESTful actions, and how those actions correlate to our database CRUD operations.

For the events resource:

* A POST to `/events` **creates** an event
* A GET to `/events` **retrieves** the collection of events
* A GET to `/events/3` **retrieves** the event with an id of 3
* A PUT or PATCH to `/events/3` **updates** the issue with an id of 3
* A DELETE to `/events/3` **destroys** the issue with an id of 3

We'll learn later that there are other, unconventional ways to create URLs for our Rails application, however, because REST provides us with a clean way to express intended database operations through HTTP, we want to adhere to what's conventional and most expressive. This will make our APIs easier to understand, and it will be easier for new developers to understand what we've built.

### Path Helpers

Now that we've established how to set up routes in our Rails app, let's look at a few useful things we can do with them.

In Sinatra, when redirecting to a specific page in our server or showing a link to a specific page in the view, we would explicitly write out the route we would need, either with the full url `localhost:3000/events/new` or the path `events/new`.

One of the many ways Rails makes things easier for developers is by giving us "helper methods", which allow us to write a few words in English instead of whole lines of code.  One of these helper methods is a path helper. A path helper is our substitute for writing out a full url, like we would have to do in Sinatra. They are often used in controller actions (e.g. to redirect_to new_event_path another path) or in views (e.g. when setting up links between pages). A Rails path helper is composed of:

1. a route `Prefix`
2. `_path`

Run `rake routes` again, and this time let's look at the `Prefix` column in our `rake routes` output.  Each prefix with a GET verb can be used in a path helper, and will point to the URL in the middle column.  For example, to refer to the `/events/new` path, we take the prefix `new_event`, and append `_path` to get `new_event_path`.  Likewise, `events_path` (prefix `events` + `_path`) will give us our index page: `/events`.

Pretty simple so far, but what if we're talking about a specific event?  Take a look at the 'URI Pattern' column for the events show page.  It's actually `events/:id`, which, thinking back to Sinatra, is already a familiar syntax to us.  It also tells us that our path helper is going to be slightly different -- it's going to need an argument.

Let's say we want to get to `events/10`.  Our prefix is `event`, so we know our helper is going to be `event_path`.  When we pass in our argument '10', we get `event_path(10)`.  Similarly, to get to our edit page at `events/10/edit`, our path helper is `edit_event_path(10)`.

Since Rails is all about making things easy on its developers, there's another handy shortcut you can take with path helpers that use arguments. Rails knows that pretty much any time that you're talking about `id`s (like in your URL), what you're *really* talking about is objects in your database. Therefore, Rails allows you to pass an *entire ActiveRecord object* to your path helper as an argument. For example:

```ruby
# app/controllers/events_controller.rb

my_event = Event.first

edit_event_path(my_event.id) # passes in id
# => "/events/1/edit"

edit_event_path(my_event) # passes in whole object
# => "/events/1/edit"
```

Both of the above examples show valid ways to use a path helper, but the second one is the best practice, and most efficient with your time as a developer.

To summarize, here are the steps you should take to figure out a certain route's path helper:

1. Run `rake routes`
2. Find the relevant line from the results
3. Take the "Prefix" from that line, and append `_path`. That's your method name!
4. Check to see if there's any dynamic routing in the "URI Pattern"
5. If there is any dynamic routing, pass an argument to the path helper method telling it which entry in the database you're talking about.

### Rails View Helpers: `link_to`

Rails provides some helpful methods you can call within your view that generate HTML for you. You can see this link with more context by opening the `app/views/events/index.html.erb` file.

One you'll be using regularly is `link_to`:

```erb
# app/views/events/show.html.erb

<%= link_to 'Edit', edit_event_path(event) %>
```

The above ERB tag will evaluate to an HTML tag on your rendered page that look like this:

```html
<a href="/events/12/edit">Edit</a>
```

The `link_to` method takes in two arguments: a string representing the anchor text for your link, and a string representing the URL you want the user to visit. For the second string, you should (almost) always use a path helper!

You can also add a certain class or id to a link with the following syntax:

```erb
# app/views/events/show.html.erb

<%= link_to 'Edit', edit_event_path(event), class: "button", id: "awesome-edit-link" %>
```

### External Resources

* [Rails Routing From the Outside In (Rails Guides)](http://guides.rubyonrails.org/routing.html)
* [CRUD Verbs and Actions](http://guides.rubyonrails.org/routing.html#crud-verbs-and-actions)
