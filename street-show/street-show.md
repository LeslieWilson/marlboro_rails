## Getting Started

From your `challenges` folder in the terminal, type the following commands:

```no-highlight
$ et get street-show
$ cd street-show
```

To run your code,

```no-highlight
$ ruby code.rb
```

## Exercise

You've decided that in order to afford your amusement park habit, you and your
friend will spend the afternoon trying your hand at some street performance.
Luckily you've got some crazy awesome circus tricks up your sleeve... you're
just not sure which ones people will like best.

To find out, you've written a Ruby program to automatically record each tip you get based on which trick you do! Now that you have that information, time to look at what was most successful.

Here are the tips you got while performing each trick:

Knife Juggling
- $2.10
- $0.77
- $5.00
- $1.00
- $3.00

Torch Juggling
- $6.00
- $3.50
- $7.00

Hand Balancing
- $2.00
- $1.00

Human Blockhead - [(Human what now?)](http://en.wikipedia.org/wiki/Human_Blockhead)
- $0.75
- $0.43

## Remember: Use the `format` method

Recall from previous assignments that you can use the `format` method to properly format floating point numbers.


```ruby
format("%.2f", Math::PI)
=> "3.14"
```

The above code example will round the numeric value PI to 2 decimal places, and return it as a `String` instance.

## Part 1

First, let's calculate the total that you've made from each trick. For each trick, write a line of Ruby code that calculates the sum of your tips and saves the result as a variable. Then print a summary of your totals to the terminal window using `puts`, as so:

```no-highlight
Knife Juggling:
11.87
Torch Juggling:
16.5
Hand Balancing:
3.00
Human Blockhead:
1.18
```

Next, write a line of code that calculates and prints your total income:

```no-highlight
Total:
32.55
```

Last of all, you want to learn the [average][Average] amount of each tip. Find the average by using the variables you set earlier on to calculate the total sum, and then divide by the number of tips you've received. Print your result to the terminal window:

```no-highlight
Average Tip Value:
2.7125
```

## Part 2

You've decided to up your street-performing game by adding in some audience participation to your shows - and doing it via Ruby code! Everyone will surely go wild about the one-and-only Ruby-programmed street show. Write some lines of code that achieve the following steps:

- Ask for an audience volunteer.
- Ask the volunteer's name.
- Accept the user's input and save it as a variable.
- Ask the audience to provide a big round of applause for the volunteer, referencing them by the provided name.
- Ask what the volunteer's favorite number is.
- Accept the user's input and save it as a variable.
- State that you and your friend will juggle these knives around the volunteer for a certain number of seconds, where the number of seconds is equal to the volunteer's favorite number.

Example Output:
*(Exact wording is up to you!)*

```no-highlight
Hello everybody! Today, my assistant and I will be showing you acts of great daring. Can I have an audience volunteer?
There's our brave volunteer! What's your name?
> Michael
Everyone give a big round of applause for Michael!
Now Michael, what's your favorite number?
> 23
Alright Michael, my friend and I will be juggling these knives around you for 23 seconds. Are you prepared to be amazed?
```
[Average]: https://www.mathsisfun.com/definitions/average.html
