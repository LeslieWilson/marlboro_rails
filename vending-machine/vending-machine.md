## Getting Started

From your `challenges` folder, type the following command:

```no-highlight
$ et get vending-machine
$ cd vending-machine
```

All your work should be done in the `code.rb` file. You can run your code in the terminal with:

```no-highlight
$ ruby code.rb
```

### But First, a Word on Indexes

`.index` is a method you can call on a string.  If you pass in a second string as an argument, it will tell you what place, or index, in the original string it falls.  For instance, let's say we have the string `"chinchilla"`.  We want to know the `n`'s position.  We can use `.index` like so:
```no-highlight
"chinchilla".index("n")
=> 3
```
Indexes are weird, they start counting at 0, instead of 1.  So "n" has an index of 3. Don't worry, there will be a whole lesson on indexes later!

## Exercise

You've decided that secondary to writing code, selling snacks is your real
passion in life - which means it's time to write a high-tech Ruby vending
machine!

To keep track of the contents of your vending machine, you decide to store the
name of each item you have in one big string representing your inventory:

`items_we_have = "chips popcorn skittles clif-bar mentos gum cheetos m&ms"`

When a user enters a word representing which item they want, you need to
figure out where that item resides in the string!

Write a program that asks a user for an item they would like from the vending
machine. Once they type the word, check to see what its [index](https://ruby-doc.org/core-2.3.0/String.html#method-i-index) is in the
string provided above. If the word is part of the string, and the return value is not `nil`, print the index. If the word is not in the string, and the index is `nil`, print a line saying that you don't have that item.

#### Example Output

If item exists:

```no-highlight
What item would you like?
> cheetos
Item index:
43
```

If item doesn't exist:

```no-highlight
What item would you like?
> coconuts
We don't have that item.
```

{% show_solution %}
```ruby
  items_we_have = "chips popcorn skittles clif bar mentos gum cheetos m&ms"
  puts "What item would you like?"
  input = gets.chomp
  item_index = items_we_have.index(input)
  if item_index.nil?
    puts "We don't have that item."
  else
    puts "Item index:"
    puts item_index
  end
```

If you're thinking that this solution is very simple, or may not account for edge cases, you'd be right.  Feel free to adjust your code to give the user the best experience possible.  Remember, there are many ways to get to the right answer!

{% endshow_solution %}
