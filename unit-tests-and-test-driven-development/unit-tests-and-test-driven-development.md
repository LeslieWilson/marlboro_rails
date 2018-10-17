In this article, we will show how to write **unit tests**.

### Learning Goals

* Create a class with a corresponding unit test
* Add a failing test and then implement the feature to make it pass
* Refactor code once there is a passing test suite

### How to Unit Test with RSpec

When writing tests it is customary to have a separate corresponding **spec file** for every class file in your project.
These spec files are called **unit tests** and they will focus on testing individual classes.
Let's lay out an example of the convention for how we would set up an `Airplane` class and its corresponding spec file:

```
.
├── lib
│   └── airplane.rb
└── spec
    └── lib
        └── airplane_spec.rb
```

Here we have two files: `airplane.rb` which will contain the class definition and `airplane_spec.rb` that will contain the tests for that class.
Let's start with `airplane.rb` and provide a bare-bones definition for our class:

```ruby
class Airplane
end
```

In the `airplane_spec.rb` file we can layout the structure of our test suite:

```ruby
require_relative "../../lib/airplane"

describe Airplane do
end
```

First we load `airplane.rb` using `require_relative` so that we have access to the Airplane class.
We can use `describe` to inform the test suite which class we're testing and provide a location for us to define our tests for this class.

### First Tests

The most common thing that we will want to write tests for on our ruby objects are methods. In our example of the Airplane class above we might want a `flying?` method that returns true or false depending on whether or not the airplane we are modeling is in the air.

We first create another describe block inside the describe for the `Airplane` class for our `flying?` method.
We will want our `flying?` method to return true or false based on the current state of the aircraft.
To illustrate this we will create two `context` blocks within our `#flying?` method block to clarify the different states we expect our aircraft to be in when we want to determine if it is flying or not.
The final step in outlining our tests is to write an `it` block in which we will place our assertion about the behavior of the flying? method call on an Airplane object in each state.

Here is an example for the layout just described:

```ruby
require_relative "../../lib/airplane"

describe Airplane do
  describe '#flying?' do
    context 'when the plane is flying' do
      it 'returns true' do
        expect(Airplane.new.flying?).to eq true
      end
    end

    context 'when the plane is not flying' do
      it 'returns false' do
        expect(Airplane.new.flying?).to eq false
      end
    end
  end
end
```

**Note:** We use `describe "#flying?"` instead of writing `describe the "flying?" method"`. Accepted convention is to use `#<method>` to refer to instance methods, particularly in testing. You may have seen this convention already in the Ruby documentation.  

Now when we run `rspec` we should see the following output:

```
$ rspec
FF

Failures:

  1) Airplane#flying? when the plane is flying returns true
     Failure/Error: expect(Airplane.new.flying?).to eq true
     NoMethodError:
       undefined method `flying?' for #<Airplane:0x007feee1efb9d8>
     # ./spec/lib/airplane_spec.rb:7:in `block (4 levels) in <top (required)>'

  2) Airplane#flying? when the plane is grounded returns false
     Failure/Error: expect(Airplane.new.flying?).to eq false
     NoMethodError:
       undefined method `flying?' for #<Airplane:0x007feee1efa4e8>
     # ./spec/lib/airplane_spec.rb:13:in `block (4 levels) in <top (required)>'

Finished in 0.00121 seconds (files took 0.61935 seconds to load)
2 examples, 2 failures

Failed examples:

rspec ./spec/lib/airplane_spec.rb:6 # Airplane#flying? when the plane is flying returns true
rspec ./spec/lib/airplane_spec.rb:12 # Airplane#flying? when the plane is grounded returns false
```

You will notice now that we have 2 failing tests and both tests are telling us `undefined method 'flying?'`, or in other words we haven't defined the `flying?` method on our Airplane class. Additionally we will also need some way of setting our airplane as flying or not when we create it.

If you want to challenge yourself see if you can come up with an implementation in your Airplane class to make both tests pass. As a hint once we make a way to set our Airplane state to either flying or not we will need to change our tests slightly to set up our airplanes in our tests, one to be flying and one to be not.

Here is an example solution for what this could look like:

```ruby
class Airplane
  def initialize(status)
    if status == 'flying'
      @flying = true
    else
      @flying = false
    end
  end

  def flying?
    @flying
  end
end
```

```ruby
require_relative "../../lib/airplane"

describe Airplane do
  describe '#flying?' do
    context 'when the plane is flying' do
      it 'returns true' do
        expect(Airplane.new('flying').flying?).to eq true
      end
    end

    context 'when the plane is not flying' do
      it 'returns false' do
        expect(Airplane.new('grounded').flying?).to eq false
      end
    end
  end
end
```

### Test, Code, Refactor Cycle

Now that we definitely have working code, we can try to improve on it. In the example above, our initialize method seems like it might be a bit clunky, so we could perform the following refactor.

```ruby
class Airplane
  def initialize(status)
    @flying = (status == 'flying')
  end

  def flying?
    @flying
  end
end
```

We've reduced the initialize method to just a single line. When we run our tests again, we confirm the code is still behaving the same way.

```
$ rspec
..

Finished in 0.00162 seconds (files took 0.61635 seconds to load)
2 examples, 0 failures
```

### Why Unit Test?

There are also several other things that may have become apparent as we thought through just writing these two initial basic tests. Before we even wrote the code for our Airplane class, much less the code for our `flying?` method, we thought through what the possible return values of that method could be and the state our class would need to be in to return those values.

### In Summary

Since classes create objects which encapsulate both state and behavior, it is important to test how the behavior changes based on the different states of an object. **Unit tests** will allow you to accomplish this goal.

### External Resources
* [RSpec Basic Syntax](https://www.tutorialspoint.com/rspec/rspec_basic_syntax.htm)
* [RSpec CheatSheet](https://www.rubypigeon.com/posts/rspec-expectations-cheat-sheet/)
