Writing tests before writing any code for our program is a very effective way to guide our development process and ensure our final program works correctly. This is a concept called Test Driven Development, and it produces code that is stable, well-documented, and maintainable.

In this article we introduce **RSpec**, a testing framework for Ruby, and discuss how to use it to test methods.

### Learning Goals

* Understand the syntax of an RSpec test
* Add a failing test and then implement the method to make it pass
* Refactor code once there is a passing test suite
* Understand a few benefits of writing tests first

### RSpec Documentation

A good place to start with the RSpec testing framework is their documentation. The two libraries within the RSpec framework to focus on learning are the [rspec-core library](http://rspec.info/documentation/3.4/rspec-core/) and the [rspec-expectations library](http://rspec.info/documentation/3.4/rspec-expectations/).

### Setting up RSpec

```no-highlight
$ et get method-testing-and-test-driven-development
$ cd method-testing-and-test-driven-development
```

[RSpec][rspec] is one of the two popular testing frameworks in the Ruby world, and the one we prefer at Launch Academy. You can install RSpec directly with the following command:

```no-highlight
$ gem install rspec
# from the method-testing-and-test-driven-development directory:
$ rspec
```

Once you have the gem installed, running the command `rspec` from the root directory of your project will run your test files.  RSpec knows to look for all the files under the `spec` folder that end with `_spec.rb`. See the following file structure as an example:

```no-highlight
. (<- root directory)
├──code.rb
│
└── spec
    └──code_spec.rb
```
Here we have two files: `code.rb` and `code_spec.rb`, which contains tests for the code in `code.rb`, and is stored in the `spec` folder.

### Writing our first test

Before writing any code, one should write a test for the functionality that is desired. The test serves as a guide for the code that needs to be written, and helps us know if we've written code that works to our specifications.

In this first example, we will first write a test for a method called `plus_one` that takes in a number as an argument and returns a number that is one higher than the one given.

```ruby
# spec/code_spec.rb
require_relative "../code"

describe "plus_one" do
  it "should be one plus the number given" do
    result = plus_one(0)
    expect(result).to eq(1)
  end
end
```

* The `require_relative "../code"` makes the code in `code.rb` available to our test.
* The `describe` method takes in a string that describes what is being tested. In this case, we are testing the `plus_one` method, so that's what we put in the quotes after `describe`.
Inside the block of the `describe` method, there should be one or more calls to the `it` method.
* The `it` method takes in a string that describes what the expected outcome of the test should be. Here, we expect the `plus_one` method to return a number one higher than the one given.
Inside the `it` block, there should be code that is doing the testing.
* This test is comparing that what is given to `expect` is `eq` to a particular value. In this case, we expect the `result` of `plus_one` when passed a value of `0` to be `1`.
Therefore the argument passed to `expect` is the result value of `plus_one(0)`, and the argument given to `eq` is `1`.

Running `rspec` gives us the following output.

```no-highlight
F

Failures:

  1) plus_one should be one plus the number given
     Failure/Error: result = plus_one(0)

     NoMethodError:
       undefined method `plus_one' for #<RSpec::ExampleGroups::PlusOne:0x007f9712bdb5b8>
     # ./spec/code_spec.rb:6:in `block (2 levels) in <top (required)>'

Finished in 0.00102 seconds (files took 0.18236 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/code_spec.rb:5 # plus_one should be one plus the number given
```

Pay particular attention to

```no-highlight
 NoMethodError:
   undefined method `plus_one' for #<RSpec::ExampleGroups::PlusOne:0x007f9712bdb5b8>
 # ./spec/code_spec.rb:6:in `block (2 levels) in <top (required)>'
```

This is telling us that we have a `NoMethodError` at line 6 of the `code_spec.rb` file because we have not defined the `plus_one` method yet.
Let's define it in our `code.rb`:

```ruby
# code.rb
def plus_one
end
```

Running `rspec` gives us the following

```no-highlight
F

Failures:

  1) plus_one should be one plus the number given
     Failure/Error: result = plus_one(0)

     ArgumentError:
       wrong number of arguments (1 for 0)
     # ./code.rb:2:in `plus_one'
     # ./spec/code_spec.rb:6:in `block (2 levels) in <top (required)>'

Finished in 0.00066 seconds (files took 0.18568 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/code_spec.rb:5 # plus_one should be one plus the number given
```

The important part of this message is:

```no-highlight
ArgumentError:
 wrong number of arguments (1 for 0)
# ./code.rb:2:in `plus_one'
# ./spec/code_spec.rb:6:in `block (2 levels) in <top (required)>'
```

This is telling us that we have a `ArgumentError` at line 2 of our `code.rb` file because it does not currently take in any arguments, but in line 6 of our `code_spec.rb` file we gave it an argument of `0`.

Note how when making the test pass, we take an iterative approach. We write a test, make sure it fails, write some code to make the first error go away, and then run the test again until it passes.

To clear the `ArgumentError` we got next, let's add an argument to our `plus_one` method:

```ruby
# code.rb
def plus_one(number)
end
```
When `rspec` is run we get:

```no-highlight
F

Failures:

  1) plus_one should be one plus the number given
     Failure/Error: expect(result).to eq(1)

       expected: 1
            got: nil

       (compared using ==)
     # ./spec/code_spec.rb:7:in `block (2 levels) in <top (required)>'

Finished in 0.03848 seconds (files took 0.17936 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/code_spec.rb:5 # plus_one should be one plus the number given

```

No errors were raised during the execution of the code. However, our test is still failing.

This is because the test did not get the expected result of `1` when `0` was passed to our method. In this case, the important part of the error message is coming from RSpec instead of the Ruby interpreter:

```no-highlight
 expected: 1
      got: nil

 (compared using ==)
# ./spec/code_spec.rb:7:in `block (2 levels) in <top (required)>'
```

We see that in line 7 of our `code_spec.rb` file, we expected the return value of `plus_one` with `0` as an argument to return `1`, but instead the method returned `nil`.

Let's finish implementing the method so that it produces the expected result:

```ruby
# code.rb
def plus_one(number)
  result = number + 1
  return result
end
```

And now when we run `rspec` we get

```no-highlight
.

Finished in 0.0011 seconds (files took 0.17118 seconds to load)
1 example, 0 failures
```

Life is good! =)

### Test, Code, Refactor Cycle

The workflow for using tests to drive the development of our code is to first write tests, and then write the code that makes the tests pass.

This workflow is referred to as **Test-Driven Development (TDD)**.

Once you have working code, you should attempt to refactor the code to see if you can make it better.

For example, we can make our `plus_one` method more concise. Ruby provides the last statement evaluated in a method as its return value, so we really don't need to assign `number + 1` to a local variable and then return it. We can do this instead:

```ruby
# code.rb
def plus_one(number)
  number + 1
end
```

Once you refactor, make sure to always run the tests again so that you know everything is still working as intended. The value of the test really shows a lot here--you can find out if your new optimization breaks anything in your test. You can also add additional test cases to make sure that unusual cases (sometimes called "edge" cases) are covered.

```no-highlight
.

Finished in 0.0011 seconds (files took 0.17118 seconds to load)
1 example, 0 failures
```

### Why Test?

We can often end up with more code in our test file than in the implementation. As a program grows, the tests grow with it and become more valuable than the program itself. If the entire set of the tests for a given program are all passing, then the code for that program is working.

There are also several other things that may become apparent as we think through writing our initial test. Before we even wrote the code for our `plus_one` method above, we thought through what argument the method should receive, and the possible return values of that method.

One of the most valuable results of test driving our code is that we're left with a tool that allows us to change the internal structure of the code with confidence that we're not breaking any expected behavior. We now have a single `rspec` command that verifies our code works as expected.

As your program grows and grows, this tool becomes more and more valuable. It saves untold amounts of time to let the computer check that every edge case of how a program runs to ensure it is working as expected.

### How Much Code Should I Write After Running The Tests?

In this example, we ran the tests and wrote the minimal amount necessary to get to the next error message. This is the most strict adherence to **Test-Driven Development**.

However, as your programming prowess increases, you may attempt to implement a whole method, granted that you first have tests which completely describe the behavior of the desired method.

In other words, it would have been fine to write the `plus_one` test shown here and then write the entire `plus_one` method. You should always make sure your test fails before writing code, however, since false positives can occur if a test is written poorly.

### In Summary

**RSpec** is a testing framework that we can use to write tests in Ruby.

To run a test suite, use the `rspec` command. This will run all test files in the *spec* directory that end in *_spec.rb*.

**Test-Driven Development** is the practice of writing tests for methods before defining the implementation of the method. Test-driven development forces you to think about how the code will be used before attempting to write any code.

After the tests have been written and the implementation is passing, it is advisable to go back and **refactor** the code to clean it up and remove any duplication. After the refactor, re-run the test suite to ensure it did not break any existing functionality.

[rspec]: http://rspec.info/
