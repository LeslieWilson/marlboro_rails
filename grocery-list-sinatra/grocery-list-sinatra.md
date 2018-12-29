### Instructions

Write a web application to manage a grocery list. It should display the groceries currently on the list and provide a form for adding a new item to buy.

### Learning Goals

* Generate a dynamic web page in response to a `GET` request.
* Persist information from a user submitted via a `POST` request.
* Implement code based on acceptance tests.

### Getting Set Up
```no-highlight
et get grocery-list-sinatra
cd grocery-list-sinatra
bundle exec bundle install
rspec
```

### Meeting Expectations Requirements

Acceptance tests have been written for you to build this grocery list app. **These tests are not to be modified.** After running the test suite with `rspec`, let the test errors guide your development and code implementation. Your first submission should satisfy the following requirements:

* Visiting `GET /` should redirect the user to `GET /groceries`.
* Visiting `GET /groceries` should display a list of groceries to purchase as well as a form for adding a new grocery item.
* The name of each grocery item must be in [an `<li>` element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/li).
* The list of groceries is read from the `grocery_list.csv` file which stores each item on a new line.
* The form to add a new grocery item requires the grocery name to be specified, and submitting an empty form does not modify the `grocery_list.csv` file.
* When a name is specified, the form submits to `POST /groceries` which saves the new item to the `grocery_list.csv` file.
* All acceptance tests pass.


### Sample Output

Below is an example of what the application should look like:

![Grocery List][sample-app]

### Tips

* As always, take a moment to familiarize yourself with the codebase. Look at each provided file, especially your test files, to get an idea of what is expected of you.

* To avoid losing past information you'll probably want to **append** to a file rather than overwrite. You can open a file for appending with the following snippet of code (the second argument, `"a"`, passed to the `CSV`'s `open` method, specifies that you want to _append_ information):

```ruby
CSV.open("some-file.csv", "a") do |file|
  # your code here
end
```

* Reminder: When `rspec` is run, everything in the CSV file (except the headers) is deleted. This happens both before any of the tests run **and** after every `it` and `scenario` block in the test suite.

* The `--fail-fast` flag has been included in the `.rspec` file for you.  This will run your test suite until a test fails, and then stop.  If you'd like to see all of the failing tests at once, you may remove this flag.

### Exceeding Expectations Requirements

**You may update the spec files, as well as any configuration files, as needed to complete this portion of the System Check.

Write acceptance tests for each of the following scenarios and implement the features they describe.
* Add `quantity` as an optional field to the grocery item form.
  - Submitting a form with both a name and a quantity should add the grocery item to the list.
  - The quantity of each item should not be displayed on the list.
* If the form is submitted with only a quantity, and no grocery item, it should not be added to the grocery list. Instead, the page should be re-rendered with the previously submitted quantity pre-filled in the form.
* If the form is submitted with only a grocery item and no quantity, the quantity should default to `1`.
* When viewing this list after visiting `GET /groceries`, each grocery item should be a link.  This link should lead to a page that displays the individual grocery name and quantity.

[sample-app]: https://s3.amazonaws.com/horizon-production/images/grocery-list.png
