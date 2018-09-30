### Introduction

It's been a long day, so it's time to find our favorite pet shows to watch on Petflix! Let's write some ruby code to expedite the grueling search process!

### Instructions

You are given a few arrays of pet shows separated by genre. Utilize array searching methods to answer the following questions:

1. We heard raving reviews about all the llama dramas on Petflix! Let's write a line of code to return every show in the `dramas` array that has the word `"Llama"` in it.

2. Our significant other is a significant dog person. Let's write a line of code to return every show in our `animations` array that has the word `"Dog"` in it.

3. We are very picky when it comes to our funny tv shows. Write a line of code that will return every show in our `comedies` array that does *NOT* have the word `"Cat"` in it.

4. As humans, we prefer order, so we want to get a head start in alphabetizing our pet show collection. Let's take a look at our `all_shows` array and map out the first character of every show. In other words, write a line of code that will return an array of every show's first letter in our `all_shows` array.

### Notes

* As coders, we have an arsenal of awesome Ruby methods at our disposal. The following methods will be quite useful for you to complete the task at hand: `.find_all`, `.select`, `.reject`, and `.map`.
* Remember to use the following format when calling one of these methods on an array:

```ruby
selected_numbers = [1, 2, 3, 4].select { |number| number > 2 }
puts selected_numbers
```

This will result in the output of `[3,4]`.

* To check if a specific word is contained in a string, we can use the `.include?` method like so:

```ruby
"Full Mouse".include?("Mouse")
```

This will result in the output of `true`.

* You can call the zeroth index of a string to pull the first letter, so `"Andrew"[0]` will return `"A"`.

* Sometimes, we need to create new arrays based upon existing arrays. For example, if we wanted to create a collection of greetings for an array of names, we could use the following `.each` routine to make it work.

```ruby
names = ['Ella', 'Max', 'Alice']
greetings_for_names = []
names.each do |name|
  greetings_for_names << "Hi #{name}!"
end
greetings_for_names

```

That's a lot of code! Thankfully, we can use `.map` to accomplish the same task in a more concise and readable way.

```ruby
names = ['Ella', 'Max', 'Alice']
greetings_for_names = names.map {|name| "Hi #{name}!"}
```

* Read more about search methods on arrays, [here](http://ruby-doc.org/core-2.2.0/Array.html).
