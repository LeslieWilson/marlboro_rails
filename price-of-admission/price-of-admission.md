## Before You Begin

From your `challenges` folder in the terminal, type the following commands:

```no-highlight
$ et get price-of-admission
$ cd price-of-admission
$ atom .
```

If you need a refresher or you don't yet have `et` working, look for the "How to Use ET" article in your Curriculum.

## The Exercise
It's a beautiful summer day. You and some friends are on your way to an
amusement park! There are four (4) adults and two (2) children in your group.

Admission prices are marked on the sign:

```no-highlight
---------------------
| ADULTS: $12.80    |
| CHILDREN: $4.00   |
---------------------
```

Write a line of code in the provided `code.rb` file that calculates the total cost to get all six of you into the park.

This exercise is intended to be quite short. Your program should simply use the `puts` keyword to output the calculated value:

```no-highlight
59.20
```

### Bonus:

To calculate how much each adult should pay, write a line of code that
both calculates the above sum and then splits it evenly between the
four adults. Output the cost per adult. Include this code in your `code.rb` file!

#### A Brief Digression on Floating Point Numbers and Formatting

The way most programming languages store numbers with decimals can be quite problematic! It is actually _hard_ for computers to store exact values when it comes to mathematically complex numbers.

For example, let's open up IRB and take a look at the mathematical value, *PI*.

```no-highlight
Math::PI
=> 3.141592653589793
```

Going back to our Geometry class days, we know that the number PI goes on and on for [millions of digits][pi-million].

What if we want to only show two digits after the decimal? We have two options.

```no-highlight
Math::PI.round(2)
=> 3.14
```

In this example, the `round` method will round the number to the nearest 2nd decimal place.

```no-highlight
Math::PI.round(3)
=> 3.142
```

This change rounds "up" to the nearest 3rd decimal place, given the 4th decimal place is a `5`. Note, too, that the `round` method returns a new `Fixnum` and not a string.

If we wish to return a string, we can use a different approach, through the use of a `format` method call. You can check out the [documentation][Format Documentation] for further information, but here's how we're using it:

```no-highlight
format(places_to_round, number_to_round)
```

So if we were to round Pi to three places, we could do:

```no-highlight
format("%.3f", Math::PI)
=> "3.142"
```

This `format` call will still round, but it will return a **String**-based representation of the number.

We can also use the `format` method to round to 2 decimal places.  

```no-highlight
format("%.2f", Math::PI)
=> "3.14"
```

For your implementation of this challenge, use the `format` method.

## Before You Move On

Submit the code you wrote! Run `et submit` from the `price_of_admission` directory. The `et` gem will grab the whole folder and upload it to Horizon.
You'll do this a lot, so if you're having trouble with `et`, please reach out for help from other students or staff on Slack.

[pi-million]: http://www.piday.org/million/
[Format Documentation]: http://ruby-doc.org/core-2.2.0/Kernel.html#method-i-format
