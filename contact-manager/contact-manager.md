Let's set up a Sinatra application that uses a [PostgreSQL](http://www.postgresql.org/) database with [ActiveRecord](https://github.com/rails/rails/tree/master/activerecord) as its data source (rather than a `.csv` or `.json` file).

ActiveRecord provides an interface for interacting with your database and converting your results directly into Ruby objects.

### Getting Started

Run the following commands to set up your app:

```no-highlight
et get contact-manager
cd contact-manager
bundle exec bundle
bundle exec rake db:create
```

### Creating the Contacts Table

We need a table for our contacts. Create a migration with the following command in your terminal:

```no-highlight
bundle exec rake db:create_migration NAME=create_contacts
```

Next, modify the `#change` method in your `...create_contacts.rb` migration file to create our table, which will have strings for contacts' first names, last names, and phone numbers:

```ruby
def change
  create_table :contacts do |t|
    t.string :first_name
    t.string :last_name
    t.string :phone_number
  end
end
```

Let's now run that migration via

```no-highlight
bundle exec rake db:migrate && db:rollback && db:migrate
```

Remember that this handy command attempts to run our migration, roll it back, and run it again. This ensures that we've written the migration in a reversible way, in case we decide we want to "undo" this migration later.

### Setting Up the `Contact` Model

You've been provided with a `Contact` model (at `models/contact.rb`). However, our `Contact` class isn't yet connected to the `contacts` table. See if you can identify what's missing!

{% show_hint %}

We can't access the wonder that is ActiveRecord if our class doesn't inherit from ActiveRecord::Base! Add that inheritance, such that your model looks like this:

```ruby
class Contact < ActiveRecord::Base
  def name
    [first_name, last_name].join(' ')
  end
end
```

{% endshow_hint %}

### Seeding the Database
Let's add some records to our contacts table. We can populate our database using a **seeder**, a file containing code that, when run, will add records to our database table.

If you open `db/seeds.rb`, you'll find an array of hashes, `contact_attributes`, and the following:

```ruby
contact_attributes.each do |attributes|
  Contact.create(attributes)
end
```

The `db/seeds.rb` file is another one of those kind of magic parts of ActiveRecord. The `rake db:seed` command will look for a `db/seed.rb` file and run the code that we write inside of it.

Go ahead and run
```
bundle exec rake db:seed
```

The `db/seeds.rb` file is a good place to write code that populates your database with some records. In our case, we're iterating through `contact_attributes`, creating a new Contact using each set of attributes.

### Querying the Database for Contacts

We now have a `contacts` table and a `Contact` model, and we've seeded our database with some data. Run

```no-highlight
ruby server.rb
```
and navigate to [http://localhost:4567][localhost].

You should see a page with a heading, "Contacts". Our `server.rb` file tells us that this is `views/index.erb`. Looking at `index.erb`, we see it expects `@contacts`, which should be all the contacts in our contacts table.

Add code to your `/` route to achieve this using one of the methods provided by ActiveRecord.

{% show_hint %}

```ruby
get '/' do
  @contacts = Contact.all
  erb :index
end
```
{% endshow_hint %}

_What SQL query does this method produce?_
{% show_hint %}
```no-highlight
SELECT * FROM "contacts";
```

{% endshow_hint %}

### Add a Contacts `show` Page

Your turn to build a page!

Create a `show` page that displays the information for each contact in the database. Users should be able to navigate to `/contacts/:id` to see the information for the contact with the given ID.

**Hint:** Check out the documentation for ActiveRecord at [RailsGuides](http://guides.rubyonrails.org/active_record_querying.html) to learn more about the methods ActiveRecord provides for querying the database.

### Additional Challenges

1. Add pagination to the contacts index page, such that only three contacts are shown at a time and the user can click a button to view the next set of three
  - Hint: check out the ActiveRecord `limit` and `offset` methods
* Add a search functionality so users can search for a contact by first and last name
  - Hint: check out ActiveRecord's `where` method
* Add a page where users can add new contacts to the database

[localhost]: http://localhost:4567
[migrations]: http://guides.rubyonrails.org/migrations.html#creating-a-migration
[inheritance]: http://rubylearning.com/satishtalim/ruby_inheritance.html
