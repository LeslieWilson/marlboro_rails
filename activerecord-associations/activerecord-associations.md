In this article we'll begin to work with associations in ActiveRecord.

### Learning Goals

* Visualize and construct one-to-many-relationships and many-to-many-relationships
* Configure and incorporate belongs_to and has_many associations in ActiveRecord objects
* Appropriately model schema to support the existence of ActiveRecord associations

### Key Terms & Concepts
* one-to-many-relationship
* many-to-many-relationship
* has_many
* belongs_to
* has_many :through

### Setup
```no-highlight
et get activerecord-associations
cd activerecord-associations
bundle exec bundle
bundle exec rake db:create
```

### Database Relationships

A database can be incredibly simple, incredibly complicated, and anywhere in between. We rely on our database to keep track of our information and manage the relationships between tables. By the end of this article you should have a better understanding of how these relationships work and how you can manage them using ActiveRecord.

For instance: A blog-site can have many articles; an article can have many comments; a user can have many comments. These are known as **one-to-many** relationships.

An alternative example could be: A course can have many students; and a student can have many courses. These are known as **many-to-many** relationships.

We currently understand these relationships in terms of interacting with the world around us. In this assignment, we'll begin to look at how to represent these relationships in our applications, both at the database layer and the model layer.

### Enter the Blogosphere

In this article, we will consider the ER diagram below, which describes a blog with articles and comments on those articles.

![Entity-Relationship Diagram for articles and comments](https://s3.amazonaws.com/horizon-production/images/erd-articles-comments.png)

### Creating Articles

To begin, we'll create an `Article` model:

```ruby
# app/models/article.rb

class Article < ActiveRecord::Base
end
```

For every model in our `app/models` folder, we need an associated table in our database. Let's create a migration to handle creating the corresponding `articles` table:
```no-highlight
bundle exec rake db:create_migration NAME=create_articles
```

Inside the generated `db/migrate/YYYYMMDDHHMMSS_create_articles.rb` file:

```ruby
# db/migrate/YYYYMMDDHHMMSS_create_articles.rb

class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :subject, null: false
      t.text :story, null: false

      t.timestamps null: false
    end
  end
end
```

After creating our database and running `bundle exec rake db:migrate`, we should have our `articles` table.

#### Creating Comments

We also want to let people comment on our articles, which we'll store in a separate `comments` table. A comment should have some text associated with it but it also needs to be associated with an article, somehow. We can accomplish this by creating a **foreign key** from our `comments` table back to our `articles` table.

To begin, we'll create a `Comment` model:

```ruby
# app/models/comment.rb

class Comment < ActiveRecord::Base
end
```

And then we'll create a migration to handle creating the corresponding `comments` table in the database with `bundle exec rake db:create_migration NAME=create_comments`.

Inside the generated `db/migrate/YYYYMMDDHHMMSS_create_comments.rb`:

```ruby
# db/migrate/YYYYMMDDHHMMSS_create_comments.rb

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
```

**Migrate the database again to finish creating the `comments` table.**

Notice how we included the `article_id:integer` attribute in our model. The `article_id` column on the `comments` table refers to the `id` column on the `articles` table. In this scenario, `article_id` is the _foreign key_ and `id` is the _primary key_. This enables us to have a single record in the `articles` table that corresponds to zero or more records in the comments table.

#### Creating Records

Let's load up our app in a pry session and create some records in our database.

**You can fire up a pry session and require all of your app with `pry -r ./app.rb`.**

Run the following commands in your pry session:

```ruby
cat_article = Article.create(subject: "Some thoughts about cats", story: "They're OK.")
ruby_article = Article.create(subject: 'Ruby vs. Python', story: 'Ruby wins cause I said so.')

Comment.create(body: 'LOL', article_id: cat_article.id)
Comment.create(body: 'click here for a free iPad!', article_id: cat_article.id)

Comment.create(body: 'great analysis!!!', article_id: ruby_article.id)
Comment.create(body: 'ruby is so 2010, Go is the future', article_id: ruby_article.id)
Comment.create(body: 'i like ice cream', article_id: ruby_article.id)
```

Notice that when we created a comment, all we had to do was give it the ID of the article that it belonged to so that the foreign key was setup correctly.

#### Retrieving Associated Records

A very common operation in ActiveRecord is to start with a single record, and then retrieve a list all of its associated records (e.g. find a user and list all of their friends, find a movie and list all of the cast, etc.). Let's write a Ruby method, utilizing SQL, to find all of the comments associated with a single article.

```ruby
class Article < ActiveRecord::Base
  def comments
    sql = "SELECT * FROM comments WHERE article_id = #{id}"
    Comment.find_by_sql(sql)
  end
end
```

We can do better than this. ActiveRecord contains query methods that allow us to avoid writing SQL, so we can focus on working in the universe of Ruby objects. We can utilize the `where` method to look up the comments for an article:

```ruby
article = Article.where(subject: 'Some thoughts about cats').first
comments = Comment.where(article_id: article.id)
```

We first retrieve the article based on the subject using our `where(subject: 'Some thoughts about cats').first` method and then we query for comments using `where(article_id: article.id)`. We're first finding the **primary key** of the article and then matching that to the **foreign key** on the comments table.

**Quick challenge:** Retrieve the article associated with the comment "i like ice cream".

Now, let's rewrite the `comments` method on the article class to use the `where` method:

```ruby
class Article < ActiveRecord::Base
  def comments
    Comment.where(article_id: id)
  end
end
```

Association methods such as these are a very common occurrence. So much so, that the developers of ActiveRecord added ways to shortcut the writing of methods such as the one above. We can use [ActiveRecord Associations](http://guides.rubyonrails.org/association_basics.html) to make the process of retrieving associated records much easier.

### Using ActiveRecord Associations

ActiveRecord provides a number of different types of associations. Here, we'll look at associations that are used to establish a one-to-many relationship: [has_many](http://guides.rubyonrails.org/association_basics.html#the-has-many-association) and [belongs_to](http://guides.rubyonrails.org/association_basics.html#the-belongs-to-association).

#### `has_many`

In our `Article` model, we can let ActiveRecord know about the one-to-many relationship:

```ruby
class Article < ActiveRecord::Base
  has_many :comments
end
```

The `has_many` method will set up our association between the `Article` and the `Comment` model. In order for this to work correctly, the Comment class must have a foreign key `article_id` that refers to instances of the Article class.  By saying that `article` "has many" comments, it is expecting to find a model named `Comment` that has an `article_id` attribute.

Adding this `has_many` method gives us methods that we can use to now easily query for the articles that are associated with a given article object.

We can test our new association by loading up our app in a pry session and running the following command:

```ruby
article = Article.first
article.comments
```

The line `article.comments` will return the same records that `Comment.where(article_id: article.id)` returns. By following the conventions that ActiveRecord asks of us (i.e. naming our foreign key `article_id` after the model name), we can benefit from these shortcuts that ActiveRecord provides.

#### `belongs_to`

In addition to an `Article` having many `Comment`s, a `Comment` also has the inverse relationship with its `Article`. Given a `Comment`, we can find the `Article` that it belongs to using the following:

```ruby
comment = Comment.first
article = Article.where(id: comment.article_id).first
```

With ActiveRecord, we can define this relationship to make querying for the `article` a bit easier by using an association.

```ruby
class Comment < ActiveRecord::Base
  belongs_to :article
end
```

Here we've defined the relationship between our `Comment` and the `Article`: the `Comment` belongs to the `Article`. Doing this provides the `.article` method on an instance of the `Comment` class for easy lookup:

```ruby
comment = Comment.first
comment.article
```

This returns the same record as `Article.where(id: comment.article_id).first` did except we have to use far less syntax. ActiveRecord makes manipulating our records much simpler to the point where we don't have to deal with SQL on a regular basis and can instead focus on using our objects and the relationships between them.

Whenever we define a `has_many` association, there should be a corresponding `belongs_to` association. If an article has many comments, it follows that a comment belongs to an article. We should define the association `has_many :comments` in the `Article` model **and** define the `belongs_to :article` association in the `Comment` model. You should not declare one without the other.

Declaring associations between our ActiveRecord models gives us a host of methods to help with the creation and retrieval of related objects. For instance, declaring that an article `has_many :comments` gives us the following methods on the `Article` class: `Article#comments.empty?`, `Article#comments.size`, `Article#comments`, `Article#comments<<(comment)`, `Article#comments.delete(comment)`, `Article#comments.destroy(comment)`, `Article#comments.find(comment_id)`, `Article#comments.build`, `Article#comments.create`

Read more about the methods we get for 'free', here: [`ActiveRecord::Associations::ClassMethods`](http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html).

### Many-to-Many Relationships

We've already learned about relationships in which both parties can be both the parent and child of the other, as well as the need for a join tables. Good news: none of that changes with ActiveRecord. The only addition we'll make is that **we now need a model for our join table**, which will include the necessary associations.  Let's say we have articles and authors in our application. We will define classes for these abstractions, such that an `Article` can have more than one `Author` and vice versa. Because of this, we suddenly have a "many-to-many" relationship.

This becomes a challenge for us when having to define this relationship in our tables and models. Does an Article belong to an Author, or does an Author belong to an Article? Neither. As you learned previously, we need a join table to help us manage this relationship. We can call this table `article_authorships`, and the corresponding model can be called `ArticleAuthorship`.

We can then define our associations like so:

```ruby
class ArticleAuthorship < ActiveRecord::Base
  belongs_to :author
  belongs_to :article
end
```
Easy enough, right?  But now our `Author` and `Article` models are going to look slightly different.
```ruby
class Author < ActiveRecord::Base
  has_many :article_authorships
  has_many :articles, through: :article_authorships
end
```
```ruby
class Article < ActiveRecord::Base
  has_many :article_authorships
  has_many :authors, through: :article_authorships
end
```
Here's a bit of new syntax, though it's pretty intuitive.  Since the `article_authorships` table is the child of both `authors` and `articles`, we naturally need corresponding `has_many` relationships. But the way we tell ActiveRecord that this is a many-to-many relationship is by the `has_many...through` association. With this relationship in place, we can call `Author.first.articles`, or `Article.first.authors`, and we'll still get the right associations and the right data.

Each entry in our join table `article_authorships` is a snapshot of a relationship between one article, and one author. Every time we want to make new relationships between the two, we will need a new entry in our `article_authorships` table.

Let's revisit the course-student example that we briefly mentioned at the start of this article.

Let's think about the relationship between a course and a student. A course can have many students; and a student can have many courses. At first we might make an ER diagram that looks like this:

![ER Diagram with Complex Many-to-Many Relationship](https://s3.amazonaws.com/horizon-production/many-to-many-incorrect.png)

But that is too messy, and does not accurately reflect how we will manage these relationships in the database.

Once again, we have a many-to-many relationship. This necessitates a **join-table** that will keep track of the many relationships that students can have with courses.

We can call this join table the `registrations` table. Students and courses will now be joined via a registration. A registration table will need both a foreign_key for student and a foreign_key for course defined on them. Our new ER diagram might look like:

![ER Diagram with Simplified Many-to-Many Relationship](https://s3.amazonaws.com/horizon-production/many-to-many-simple.png)

Much better!

We'll also need to organize our models correctly. Below, you can see an example of our `Course` and `Student` models, where each `has_many` associations through our join table, registrations. The `Registration` model shows that an instance of a `Registration` belongs_to both a `Course` and a `Student`. *Remember, pluralization matters!*

```ruby
class Course < ApplicationRecord
  has_many :registrations
  has_many :students, through: :registrations
end
```
```ruby
class Student < ApplicationRecord
  has_many :registrations
  has_many :courses, through: :registrations
end
```
```ruby
class Registration < ApplicationRecord
  belongs_to :course
  belongs_to :student
end
```

The migrations needed to create your matching schema are below. Note that in order for our application to work correctly, we will need both the correct associations defined on our models and we will need to have set up our tables in our databases correctly via migrations. This is just one possible example. You may also have validations and other information included.

```no-highlight
bundle exec rake db:create_migration NAME=create_students
```

_Note_: The underscore in `create_students` indicates that the subsequent letter should be capitalized (as `createStudents`)

```ruby
class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
```

```no-highlight
bundle exec rake db:create_migration NAME=create_courses
```
```ruby
class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
```

```no-highlight
bundle exec rake db:create_migration NAME=create_registrations
```
```ruby
class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.belongs_to :course, null: false
      t.belongs_to :student, null: false

      t.timestamps null: false
    end
  end
end
```

If we took a look at the schema created thus far, we would see that each record in our `registrations` table will contain two rows for foreign keys, one for the `course_id` and one for the `student_id`. This helps us understand the associations between our join tables and our course and student tables.

Thinking through database relationships can be challenging at first, but with practice will become second nature. Can you think of your own example of a `has_many, :through` situation?

### Throw away `_id` and `.id`!

Now that we are moving towards a solid understanding of ActiveRecord, it's time to take the training wheels off. Notice that when we created our tables, we didn't have to specify a primary key. This was created for us by ActiveRecord. Even cooler, ActiveRecord can look at an entire object and identify its ID when you are using your ActiveRecord methods. This means we can pass in a whole object as an attribute, and ActiveRecord will be have the same reaction as if we just pass in an ID.  This makes our code much more readable:

```ruby
ruby_article = Article.create(subject: 'Ruby vs. Python', story: 'Ruby wins cause I said so.')

# don't do this
# Comment.create(body: 'LOL', article_id: ruby_article.id)

# do this
Comment.create(body: 'LOL', article: ruby_article)
```

The difference is subtle: In the first scenario, we are relying on the primary key/foreign key relationship within the database to create our association. In the second scenario, we are more explicitly creating an association between whole Ruby objects, not just the IDs.

Keep in mind, you will still have `article_id` in your migrations and schema, because the way the information is being stored and referenced in your database does not change.  This is merely an easier, more intuitive way to make our associations.

**Quick Challenge**: Refactor your code to omit the use of `_id` and `.id` where possible.

### Summary

The most striking thing about associations is **how readable they make relationships between objects**. Once you become acclimated to their use, you'll start to examine models by looking at how their declared associations work, their relations to dependents, as well as their validations and scopes. A single line of code in a model can tell you an enormous amount about a database relationship.

### External Resources

* [Rails Guide to ActiveRecord Associations](http://guides.rubyonrails.org/association_basics.html)
* [ActiveRecord::Associations::ClassMethods](http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html)
