## OMG We don't know all the ingredients!

### Learning Goals

* Understand post requests and HTTP request-response
* Understand the `params` hash that is part of web frameworks.

### Instructions

Our Brussels Sprouts recipe webpage only lists the first ingredient. This is a problem. How can we have sumptuous Brussels Sprouts without knowing how to make them? Well, we are web developers, and hungry ones at that. We can build a form to `index.erb` that will post to `'/ingredients'` and add the user's input to the list.

```
1 1/2 pounds Brussels sprouts
3 tablespoons good olive oil
3/4 teaspoon kosher salt
1/2 teaspoon freshly ground black pepper
```


### Input

Make sure you have all of your dependencies installed by `cd`ing into your directory and running `bundle`. Run `ruby server.rb` from your terminal. You should be able to open your browser and go to `http://localhost:4567` to see the current status of the site.

### Output

When users submit input using your form, your site should look something like the following:

![alt](https://s3.amazonaws.com/horizon-production/images/FCq35i5.png)


### Tips

* You might want to put a `binding.pry` into your `POST` method and inspect the `params`, but other than that, you should not be making any changes to the file.
* Follow the example in the reading for help!
* Pay attention to what you're naming your input field, as it should match what the `POST` method in `server.rb` is looking for.
* Remember that `params` is just a hash! You can access its values the same way you would with any old hash in Ruby.
