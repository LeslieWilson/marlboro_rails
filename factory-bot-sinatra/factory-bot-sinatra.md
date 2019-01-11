In this article we'll discuss how to use FactoryBot to quickly setup database records for testing.

### Learning Goals

* Refactor test code
* Define and use a factory
* Create multiple records at once from a factory
* Define and use a factory sequence

### Isolating Tests

Each test we write for our application should work in isolation. We don't want the changes in one test to affect the outcome of another test. Isolating our tests from one another makes it simple to test behavior without worrying about other tests that have come before or after.

The problem with this approach is that to test any sort of interesting behavior, we will often need to run extensive amounts of setup to get our environment to simulate those conditions. For example, if we were testing a review site like Yelp and wanted to test that a web page lists all of a user's reviews, we'd need to create a user, some reviews and the places that they reviewed just for a single test. This data is called sample data or [fixtures](http://guides.rubyonrails.org/testing.html#the-low-down-on-fixtures). When we have a large test suite, the amount of time we spend setting up and maintaining our fixtures can quickly outpace the amount of time spent testing interesting behavior.

We can simplify our lives by using predefined **factories** that will create records for a model with some generic attributes. In addition to defining generic attributes, it can also be used to create any associated objects for us that are required for validations but not really pertinent to the test itself.

### Setup

For this article we'll use a recipe application to demonstrate how FactoryBot works. Let's start with a simple Sinatra back-end:

```no-highlight
$ et get factory-bot-sinatra
$ cd factory-bot-sinatra
$ bundle install
```

This will create a new Sinatra application configured for RSpec, _without_ FactoryBot, and configured to use PostgreSQL.

Now let's setup our application for FactoryBot. Add the following gem into the bottom of the `group :test, :development` block in your `Gemfile` (located in the root of the application):

```ruby
gem "factory_bot"
```

You should also un-comment these 2 lines from the `/spec/spec_helper.rb` file:

```ruby
require "factory_bot"
...
Dir[File.join(File.dirname(__FILE__), "factories", "*.rb")].sort.each { |f| require f }
```

This will include the `factory_bot` gem when we're working in the tests. Specifically, we have now added the gem, required it in our app, and told it exactly where to find our factory files.

After saving these files, run the following commands:

```no-highlight
$ bundle install
$ bundle exec rake db:create
$ bundle exec rake db:migrate
$ bundle exec rake db:test:prepare
```

After creating our database, we ran our migrations which created the `recipes` table in our `sinatra_recipes_development` database. Running `rake db:test:prepare` then copied the same schema into our `sinatra_recipes_test` database. At this point, we should have an application with a single ActiveRecord model and a pending RSpec test that was provided for us.

We can verify that we've configured rspec and FactoryBot correctly by running `bundle exec rspec`, which should output the following:

```no-highlight
$ bundle exec rspec

*

Pending:
  Recipe add some examples to (or delete) ../recipes/spec/models/recipe_spec.rb
    # Not yet implemented
    # ./spec/models/recipe_spec.rb:4

Finished in 0.00092 seconds (files took 4.34 seconds to load)
1 example, 0 failures, 1 pending
```

Now we can get back to testing...

### Finding Quick Recipes

Let's return to our recipe application and see how we can use FactoryBot to simplify our tests. Add the following validations to our model in `models/recipe.rb`:

```ruby
class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :instructions, presence: true
  validates :cooking_time, numericality: { greater_than: 0 }
  validates :servings, numericality: { greater_than: 0 }
end
```

Now we want to test-drive a `quick_recipes` method on our `Recipe` class that returns only recipes that have the cooking time of less than 30 minutes. We might start with something like this in our `spec/models/recipe_spec.rb` file:

```ruby
require "spec_helper"

RSpec.describe Recipe, type: :model do
  describe ".quick_recipes" do
    it "returns recipes with a cooking time less than 30 min" do
      pb_and_j = Recipe.create! do |r|
        r.name = "Peanut Butter & Jelly Sandwich"
        r.instructions = "It's Peanut Butter Jelly Time!"
        r.cooking_time = 5
        r.servings = 1
      end

      pot_roast = Recipe.create! do |r|
        r.name = "Pot Roast"
        r.instructions = "Put the roast in a pot, turn on the stove, and wait."
        r.cooking_time = 240
        r.servings = 12
      end

      cheerios = Recipe.create! do |r|
        r.name = "A Bowl of Cheerios"
        r.instructions = "bloop"
        r.cooking_time = 2
        r.servings = 1
      end

      results = Recipe.quick_recipes

      expect(results).to include(pb_and_j)
      expect(results).to include(cheerios)

      expect(results).to_not include(pot_roast)
    end
  end
end
```

Here we're testing a method on our `Recipe` model. We first create some sample recipes with varying cooking times and are testing that we only receive the ones that are below a certain threshold.

If we run our test, we'll fail with an `undefined method` error since we haven't yet defined our `quick_recipes` method in the model. We can get our test to pass by implementing the following in `app/models/recipe.rb`:

```ruby
def self.quick_recipes
  where("cooking_time < ?", 30)
end
```

Now, our tests will be green, but `recipe_spec` is pretty noisy. Since we have validations on our model, when we create a new `Recipe` record we have to specify the recipe name, the instructions, a cooking time, and the number of servings. For our `quick_recipes` method, we only care about the cooking time. Yet we have to specify all of the other attributes otherwise our record won't save. Even worse, if we add another required field to the `recipes` table, we'll have to modify all of our `create!` invocations. This requires a lot of maintenance and wasted time.

Ideally, we'd like to be able to write something like:

```ruby
Recipe.create!(cooking_time: 5)
Recipe.create!(cooking_time: 240)
Recipe.create!(cooking_time: 4)
```

We can't do this using the `Recipe.create` method, but we _can_ use FactoryBot to create generic records with predefined attributes that we'll overwrite as needed.

### Defining Our Factories

FactoryBot is a gem that handles the creation of objects with predefined attributes for testing purposes. Before we can use a factory, we need to define it somewhere. There are a few conventions about where in your project the files for `factory_bot` definitions should be placed. Let's check out the `spec/factories/recipes.rb` file that was provided for us, and add the following code to it:

```ruby
FactoryBot.define do
  factory :recipe do
    name { "Green Eggs & Ham" }
    description { "Would you eat them in a box? Would you eat them with a fox?" }
    instructions { "Eggs + Ham + Food coloring" }
    servings { 4 }
    cooking_time { 45 }
  end
end
```

Now that our factory is defined, let's test it out. If we add a `binding.pry` to our `spec/models/recipe_spec.rb` file, we can run the following:

```ruby
> first_recipe = FactoryBot.create(:recipe)
> first_recipe.id            # => 1
> first_recipe.name          # => "Green Eggs & Ham"
> first_recipe.servings      # => 4
> first_recipe.cooking_time  # => 45

> second_recipe = FactoryBot.create(:recipe)
> second_recipe.id            # => 2
> second_recipe.name          # => "Green Eggs & Ham"
> second_recipe.servings      # => 4
> second_recipe.cooking_time  # => 45
```

We first create a new recipe record with `FactoryBot.create(:recipe)`. This will look up the factory we had defined earlier, create a new `Recipe` object, set the various attributes we had defined, and save it to the database. When we inspect each of the attributes, we should see that they are the same values that we had defined in our `spec/factories/recipe.rb` file.

A factory is really just a template for churning out objects. A factory wouldn't really be that useful if it could only create one object per definition, so when we call `FactoryBot.create(:recipe)` again it creates a new record with the same attributes that we had specified earlier. We can see that the database assigned a new ID to the second object which differentiates it from the previous one.

### Design Patterns

The `factory_bot` gem is an implementation of what is known as the [Factory Method pattern](https://en.wikipedia.org/wiki/Factory_method_pattern). We can ask FactoryBot for an instance of an ActiveRecord object, and it gives us one, without us needing to interact with the constructor (e.g., `Recipe.new`) for that object.

[Design patterns](https://en.wikipedia.org/wiki/Software_design_pattern) are reuseable solutions, and worthy of further study.

### Overriding Attributes

Right now, we can create lots of recipes for Green Eggs and Ham, but our tests will require a variety of different recipes. FactoryBot lets us _overwrite_ individual attributes when we're creating the object so that we can tailor them to our needs. Try the following in your pry session:

```ruby
> pot_roast = FactoryBot.create(:recipe, name: "Pot Roast")
> pot_roast.name          # => "Pot Roast"
> pot_roast.servings      # => 4
> pot_roast.cooking_time  # => 45
```

Notice how we created a record from the same factory with a different name. In the `create` method we can overwrite the attributes that are relevant to us while keeping all of the other attributes the same. This lets us create objects and focus on only the attributes that we are trying to test.

We can now use FactoryBot to clean up our object creation in our spec file:

```ruby
require "spec_helper"

RSpec.describe Recipe, type: :model do
  describe ".quick_recipes" do
    it "returns recipes with a cooking time less than 30 min" do
      first_quick_recipe = FactoryBot.create(:recipe, cooking_time: 5)
      second_quick_recipe = FactoryBot.create(:recipe, cooking_time: 4)
      long_recipe = FactoryBot.create(:recipe, cooking_time: 240)

      results = Recipe.quick_recipes

      expect(results).to include(first_quick_recipe)
      expect(results).to include(second_quick_recipe)
      expect(results).to_not include(long_recipe)
    end
  end
end
```

We can make this even more concise by un-commenting the following line in our `spec_helper.rb` file:

```ruby
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
```

The `config.include FactoryBot::Syntax::Methods` line allows us to further simplify our code by replacing `FactoryBot.create(:recipe, ...)` with `create(:recipe, ...)`. It does so by "mixing in" the methods defined in the `FactoryBot::Syntax::Methods` module into our test suite. Try it out!

Since we don't care about what the recipe was called or how much it yields when creating our tests, we only need to overwrite the `cooking_time` attribute in our factories. This both shortens our code and more clearly indicates to the reader that the relevant attribute is the `cooking_time`. If we run our test suite, we should still have a passing test.

### Multiple Records

In our previous example, we need to create multiple records for different recipes so that we can test the functionality of `quick_recipes`. FactoryBot provides some methods for creating multiple records with the same attributes via `create_list`. We can rewrite our previous spec to take advantage of this feature:

```ruby
require "spec_helper"

RSpec.describe Recipe, type: :model do
  describe ".quick_recipes" do
    it "returns recipes with a cooking time less than 30 min" do
      quick_recipes = create_list(:recipe, 2, cooking_time: 5)
      slow_recipes = create_list(:recipe, 3, cooking_time: 240)

      results = Recipe.quick_recipes

      quick_recipes.each do |quick_recipe|
        expect(results).to include(quick_recipe)
      end

      slow_recipes.each do |slow_recipe|
        expect(results).to_not include(slow_recipe)
      end
    end
  end
end
```

To setup our records, we call `create_list` and pass in our factory, the number of records to create, and the attributes to override. We're only creating a handful of records here, but for tests that require a large volume of records these methods will becomes very handy.

### Sequences

In some cases we don't want (or can't have) records with identical attributes. For example, a `:user` factory will churn out new users with a generic email and password, but we may have a constraint on our database that prevents two user rows from having the same e-mail address.

One way to solve this problem is by using **sequences** in FactoryBot. Sequences are used when we need to generate a slightly different value for each subsequent record created. Let's use a sequence to ensure that the `name` attribute is unique for each record created via FactoryBot:

```ruby
FactoryBot.define do
  factory :recipe do
    sequence(:name) { |n| "Brussels Sprouts with Bacon #{n}" }
    description { "Would you eat them in a box? Would you eat them with a fox?" }
    instructions { "Eggs + Ham + Food coloring" }
    servings { 4 }
    cooking_time { 45 }
  end
end
```

Here we changed `name { "Brussels Sprouts with Bacon" }` to `sequence(:name) { |n| "Brussels Sprouts with Bacon #{n}" }`. For a sequence we have to specify the name of the attribute and then within a code block (`{..}`) we're given a unique integer that we can do whatever with. In this case, we're substituting the integer within a string to return a unique name each time.

If we open up our pry session, we can test this out:

```ruby
> first_recipe = FactoryBot.create(:recipe)
> first_recipe.name    # => "Brussels Sprouts with Bacon 1"

> second_recipe = FactoryBot.create(:recipe)
> second_recipe.name   # => "Brussels Sprouts with Bacon 2"
```

Each time we create a record using the `:recipe` factory, it generates a unique recipe name by passing in a unique integer to the sequence we defined. We can still overwrite the `name` attribute if we wanted as well:

```ruby
> third_recipe = FactoryBot.create(:recipe, name: "Cheerios")
> third_recipe.name    # => "Cheerios"
```

### External Resources

* [FactoryBot](https://github.com/thoughtbot/factory_bot)
* [FactoryBot - Getting Started](https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md)

### In Summary

Each test for our application should work in isolation. When the behavior that is being tested requires a lot of setup code we can rely on **factories** to generate predefined objects for us with generic attributes.

**factory_bot** is a Ruby library that allows us to define factories for use within our tests. Each factory has a set of predefined attributes that can be overwritten when necessary. This lets us focus on the attributes that are relevant for the test and use sensible defaults for the rest.

Sometimes our models require an attribute to be unique per record. We can use **sequences** within our factories that will assign a unique ID to an attribute ensuring that there are no duplicates.
