We have an awesome Sinatra site where users can type in the name of a recipe, and see whether it is delicious or not - based on whether "pickled beets" are in the name! However, we currently have no tests making sure it works.

Let's fix that by writing some acceptance tests for each feature of our site! The outlines for each test is provided for you - go into the test files and fill out the tests one by one so that they pass.

## Instructions

First run `bundle` to bundle the Gemfile.

Next, go to the `spec/features/user_checks_a_recipe_spec.rb` to get a sense of what the app does. At the top of this spec file, there's a user story and a bunch of acceptance criteria written out. These are purely there for other developers' benefits - they don't effect the running of the tests, but do give you some guidance! Read through the user story and the acceptance criteria.

Your job is to fill out the five tests such that they successfully test the acceptance criteria provided! As you're working, each time an acceptance criterion has been fully tested, put an `x` between the brackets to mark it as complete. That way you and other readers of your code can track your progress!

### Tips:
- Only write one test at a time!
- Work from top-to-bottom on the acceptance criteria and the tests - they roughly align with each other.
- Remember that each acceptance criterion does not need to have its own test! You just want to make sure that if the acceptance criterion was no longer met for some reason, your test would definitely fail.
- Remember that you can put more than one `expect` statement in a test if you want!
