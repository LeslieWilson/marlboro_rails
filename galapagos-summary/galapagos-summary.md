## Introduction

Let's do a short exercise to reinforce what we've learned so far.

You are going on a family vacation to the Galapagos Islands and need to
save some information for the trip.  In order to recall the details of the
trip later, you decide to write a ruby program that will store the information.
The program will have trip itinerary details as well as fun things from the trip
so the next time you go the Galapagos you can remember your favorite spots.

Use variables in ruby to store:

* the date you leave
* the date you return home
* the hotel name
* the number of iguanas you see
* the name of your favorite beach
* the number of giant tortoises you see

Choose a number for how many iguanas/tortoises you've seen and make
up the dates/names of the other variables. Be sure to use **expressive variable names**.

## Getting Started

From your `challenges` folder, type the following command:

```
$ et get galapagos-summary
$ cd galapagos-summary
$ atom .
```

All your work should be done in the provided `code.rb` file. As long as you've navigated to this directory (using `cd galapagos-summary`), you can run your code in the terminal with:

```
$ ruby code.rb
```

When you're finished, remember to submit with `et submit`!

## Exercise

During the trip, you saw over 200 iguanas and 40 tortoises!  Now it's time to write the
Ruby program that will give a summary of your trip.  The goal of the program is to
write to the terminal an overview of all the sightings and start/end date of the trip.

You _could_ use the `+` method to combine strings together.  But, for this program,
you should take advantage of Ruby's **String Interpolation** feature.  The summary should
include the start date, end date, hotel you stayed at, favorite beach, and the total
number of animals you saw.  For example:

Example Output:

```no-highlight
We left March 13th for The Galapagos Islands and stayed at the BestWestern hotel. During
the trip I saw over 240 animals. My favorite beach during the trip was Tortuga Bay.
After an amazing trip we returned on May 1st.  Can't wait to go back!
```

{% show_hint %}
- Think about different ways we can form large strings in Ruby
- Research if Ruby has ways of making multi-line strings that allow for interpolation
- Remember only certain types of strings allow interpolation! Is there a different between single quoted strings and double quoted strings?
- Example of using string interpolation:

```ruby
twenty = 10 + 10

puts "#{twenty} is equal to 20."
```  
This outputs:
```sh
20 is equal to 20.
```
{% endshow_hint %}
