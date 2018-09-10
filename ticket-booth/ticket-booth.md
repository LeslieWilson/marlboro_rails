## Getting Started

From your `challenges` folder in the terminal, type the following commands:

```no-highlight
$ et get ticket-booth
$ cd ticket-booth
```

To run your code,

```no-highlight
$ ruby code.rb
```

## Exercise

The tides have turned, and now you are the ticket seller at the amusement park. To make your job easier, you've decided to write a Ruby program to interact with your customers!

### Part 1

Write a program that prints to the screen and takes user input.

Here is what your program should do:

- Greet the customer.
- Ask how many adult tickets they would like.
- Accept the user's answer and save it as a variable.
- Ask how many child tickets they would like.
- Accept the user's answer and save it as a variable.
- Print a sentence returning the number of adult and child tickets the user has asked for.

#### Example Output:

```no-highlight
Hello wonderful customer! Welcome to our awesome amusement park.
How many adult tickets would you like?
> 6
How many child tickets would you like?
> 2
Here are your 6 adult tickets and 2 child tickets!
```

{% show_hint %}
* Don't forget to grab input from the user via `gets.chomp` to eliminate newline characters
{% endshow_hint %}

{% show_solution %}

```ruby
puts "Hello wonderful customer! Welcome to our awesome amusement park."
puts "How many adult tickets would you like?"
adult_tickets = gets.chomp
puts "How many child tickets would you like?"
child_tickets = gets.chomp
puts "Here are your " + adult_tickets + " adult tickets and " + child_tickets + " child tickets!"
```

{% endshow_solution %}

### Part 2

Last of all, the customer has taken a look at your food menu and would like to know what some orders would cost. Impressed by your programming skill, he asks you to calculate the price of some different combinations of menu items. Luckily, you have the cost of each menu item stored in your Ruby code as a variable! Copy and paste this menu into your Ruby code:

```ruby
hot_dog = 1.27
hamburger = 4.17
funnel_cake = 3.79
ice_cream_sandwich = 0.75
```

The orders that the customer is wondering about are listed below. For each one, write a line of code that calculates the cost of the order by using the variables above. Use `puts` to print each answer to the screen!

- Two hamburgers and two ice cream sandwiches
- Eight funnel cakes and a hot dog
- Three of each item on the menu

#### Example Output:

```ruby
9.84
31.59
29.94
```

{% show_hint %}

* Remember that you can add both strings together and numbers together.

{% endshow_hint %}

{% show_solution %}

```ruby
hot_dog = 1.27
hamburger = 4.17
funnel_cake = 3.79
ice_cream_sandwich = 0.75

puts hamburger * 2 + ice_cream_sandwich * 2
puts funnel_cake * 8 + hot_dog
puts (hot_dog + hamburger + funnel_cake + ice_cream_sandwich) * 3
```

{% endshow_solution %}

### Video Solution

{% vimeo_video '124783450' %}
