Web development is heavily dependent on **c**reating, **r**eading, **u**pdating, and **d**eleting (CRUD) resources. **ActiveRecord** acts as an object-layer on top of our SQL database, abstracting us away from the complexity of SQL queries. Through inheritance, we can utilize the features of ActiveRecord to perform database CRUD actions without writing any SQL!

### Learning Goals
* Appreciate how ActiveRecord inheritance makes our lives easier!
* Become familiar with key ActiveRecord methods for CRUD
 * Create: `create`, `new`, `save`
 * Read: `find`, `find_by`, `where`; also `order`, `limit`, `offset`, and `pluck`
 * Update: updating directly and `update_attributes`
 * Delete: `delete`

### Getting Started

First, run the following commands to set up our app and create our database:

```no-highlight
et get activerecord-crud
cd activerecord-crud
bundle install
bundle exec rake db:create
```

Next, let's create an `Article` model and `articles` database table. Our target ER diagram is

![Entity-Relationship Diagram for the articles table](https://s3.amazonaws.com/horizon-production/images/erd-articles.png)

To achieve this, first create an `Article` model that inherits from `ActiveRecord::Base`,

```ruby
# app/models/article.rb

class Article < ActiveRecord::Base
end
```
Then generate a migration for adding an `articles` table to the database by running

```no-highlight
rake db:create_migration NAME=create_articles
```

Edit the generated `db/migrate/YYYYMMDDHHMMSS_create_articles.rb` file like so:

```ruby
def change
  create_table :articles do |table|
    table.string :subject, null: false
    table.text :story, null: false

    table.timestamps null: false
  end
end
```


_Note_: The `Article` model is singular, while the `articles` table is plural. Adhering to this naming convention is important, since `ActiveRecord` uses the plural form of the model name to find the associated table in the database. The [`ActiveSupport::Inflector`](http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html) class handles the singularization or pluralization of words.

Update the database by running

```no-highlight
rake db:migrate
```

Finally, let's add some records! The [faker gem](https://github.com/stympy/faker) will help us easily generate fake data. This gem has already been included in your `Gemfile` and `require`'d at the top of your `server.rb`.

To enter a `pry` session, run
```no-highlight
pry -r './server.rb'
```
and then run the following code in your `pry`:
```ruby
1000.times do
  Article.create(
    subject: "#{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
    story: Faker::Hacker.say_something_smart
  )
end
```
After the new records are created, stay in the `pry` session to follow along with the rest of this article!

## CRUD

### Create

We can create a new article in one of two ways:

#### Option 1: `.create`

We have access to the `create` class method because our `Article` class inherits from `ActiveRecord::Base`. The `create` method creates an instance of an article in memory and then saves it as a record to the database. It takes key/value pairs as arguments, where the keys are the column names on the table and the values are the values we want to save.

```ruby
article = Article.create(subject: "Google has a new logo", story: "Check it out!")
```

Try this out in the `pry` console!

#### Option 2: `.new` and then `.save`

We can also create a record in our database via ActiveRecord is via the `.new` and `.save` methods.

```ruby
funny_cat_video = Article.new
funny_cat_video.subject = "Everybody loves cats"
funny_cat_video.story = "https://www.youtube.com/watch?v=LNWjZcbv2uI#nf"
funny_cat_video.persisted?  # => false
```

The `.persisted?` method tells us whether we have actually persisted, or saved, this data to the database. The value of `false` indicates that our `funny_cat_video` currently only exists in RAM.

To save it to the database, let's use `.save`:

```
funny_cat_video.save
funny_cat_video.persisted?  # => true
```

Calling `.save` on the object executes SQL behind the scenes that actually `INSERT`s the data into the database.

### Read
We'll often want to retrieve records from our database. How can we do this?

#### Option 1: `.find`

If we know the id of the record we are looking for, we can use the `.find` method to retrieve it.

```ruby
article = Article.find(25)
```

#### Option 2: `.find_by`

If we want to look up a record by some other property, the `.find_by` method is the way to go.

```ruby
article = Article.find_by(subject: "Everybody loves cats")
```

We can use any column we wish to look up data with the `.find_by` method. What happens if a record does not exist? What happens when there are duplicate records that match?

#### Option 3: `.where`

The `.where` method is very similar to the `.find_by` method, except that it returns a collection of records that match.

```ruby
articles = Article.where(subject: "back-end matrix")
```

We also have some methods that will help us manipulate our search results:

#### `.order`

We can change the sort order of records that are returned.

```
sorted_articles = Article.order(created_at: :desc)
```

#### `.limit` and `.offset`

Typically, we want to limit the number of records we retrieve. If our query were to return millions of records, that could take up all of the RAM on a machine, which would slow down your app and other processes running on it.

```
articles = Article.limit(3)

articles = Article.limit(10).offset(5)
```

Chaining methods allows us to be more specific about the data we would like to retrieve from the database. Try retrieving the last 5 articles that were created.

#### `.pluck`

Say we want to retrieve only the subject fields of our articles. We can use `.pluck` to only return specific columns from our database:

```ruby
recent_articles = Article.order(created_at: :desc).limit(10)
subjects = recent_articles.pluck(:subject)
```

The `.pluck` method is a fairly new addition. If you find yourself working with an older version of ActiveRecord, you can achieve the same functionality with the `.map` method.

```ruby
subjects = recent_articles.map(&:subject)
```

### Update

#### _Via object properties_

You can update a record by simply changing its properties and then using `.save`:

```ruby
article = Article.last
article.story = "That's a funny subject!"
article.save
```

#### `.update_attributes`

To easily change multiple properties at once, you can use `.update_attributes` with a hash:

```ruby
article_attributes = {
  subject: "Clock Tower Struck By Lightning",
  story: "Clock stopped at 10:04.",
  created_at: Date.parse("1955/11/12")
}
article.update_attributes(article_attributes)
```

### Delete

#### `.delete` and `.delete_all`

Let's clean up some articles:

```ruby
article = Article.find(1)
article.delete
```

Now let's delete many articles at once!

```ruby
articles = Article.where(subject: "optical hard drive")
articles.delete_all
```

### Summary
ActiveRecord methods provide an easy way to create, read, update, and delete our database records

We have only scratched the surface of what we can do with ActiveRecord. Remember these basic methods. They will serve you well in the journey ahead!
