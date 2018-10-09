It's going to be another great season of golf!
In order to prepare, we need to trim down the amount of clubs in your golf bag to 10.
Because we're new to the game, we will randomize our selection.

There are requirements, however.
We need to ensure the bag contains a driver, a pitching wedge, and a putter.

Write a program that randomizes your club selections,
informs you of their configuration,
and also tells you if your selection contains the required clubs.

Start with the code below:

```ruby
REQUIRED_BAG_SIZE = 10

available_clubs = [
  :two_iron,
  :three_iron,
  :four_iron,
  :five_iron,
  :six_iron,
  :seven_iron,
  :eight_iron,
  :nine_iron,
  :pitching_wedge,
  :sand_wedge,
  :driver,
  :three_wood,
  :five_wood,
  :seven_wood,
  :putter
]

possible_club_selections = available_clubs.sample(REQUIRED_BAG_SIZE)
```

Write code to check your `available_clubs` against the requirements and show the results of these checks in the terminal.

Here's an example of what your output might look like:

```no-highlight
***Automated Golf Club Advice:***
Use the four iron!
Use the five iron!
Use the five wood!
Use the six iron!
Use the seven wood!
Use the three wood!
Use the three iron!
Use the seven iron!
Use the nine iron!
Use the driver!

WARNING! You will be without a pitching wedge
WARNING! You will be without a putter
```

{% show_hint %}

* Because we want a friendly name for each club,
  you will probably need to change your clubs from symbols to another data type. You will want to look into methods that can transform symbols to something else.
* `gsub` is a common method found on Strings that allows you to swap out pieces of a string for other pieces. Check out the [Ruby Docs](http://ruby-doc.org/core-2.3.0/String.html#method-i-gsub) for more information!
{% endshow_hint %}

{% show_solution %}
A possible solution:

```ruby
REQUIRED_BAG_SIZE = 10

available_clubs = [
  :two_iron,
  :three_iron,
  :four_iron,
  :five_iron,
  :six_iron,
  :seven_iron,
  :eight_iron,
  :nine_iron,
  :pitching_wedge,
  :sand_wedge,
  :driver,
  :three_wood,
  :five_wood,
  :seven_wood,
  :putter
]

possible_club_selections = available_clubs.sample(REQUIRED_BAG_SIZE)

puts "\*\*\*Automated Golf Club Advice:\*\*\*"

possible_club_selections.each do |selection|
  puts "Use the #{selection.to\_s.gsub("\_", " ")}!"
end

puts ""

[
  :driver,
  :pitching_wedge,
  :putter
].each do |required_club|
  if !possible_club_selections.include?(required_club)
    puts "WARNING! You will be without a #{required_club.to\_s.gsub("\_", " ")}"
  end
end

```

Here's another interesting solution,
using array math to determine missing, but required clubs.

```ruby
REQUIRED_BAG_SIZE = 10

available_clubs = [
  :two_iron,
  :three_iron,
  :four_iron,
  :five_iron,
  :six_iron,
  :seven_iron,
  :eight_iron,
  :nine_iron,
  :pitching_wedge,
  :sand_wedge,
  :driver,
  :three_wood,
  :five_wood,
  :seven_wood,
  :putter
]

possible_club_selections = available_clubs.sample(REQUIRED_BAG_SIZE)

puts "\*\*\*Automated Golf Club Advice:\*\*\*"

possible_club_selections.each do |selection|
  puts "Use the #{selection.to\_s.gsub("\_", " ")}!"
end

puts ""

REQUIRED_CLUBS = [:driver, :pitching_wedge, :putter]

missing_required_clubs = REQUIRED_CLUBS - possible_club_selections
missing_required_clubs.each do |required_club|
  puts "WARNING! You will be without a #{required_club.to\_s.gsub("\_", " ")}"
end
```
{% endshow_solution %}
