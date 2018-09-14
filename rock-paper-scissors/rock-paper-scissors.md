## Instructions

Write a program where the user can play a round of **Rock, Paper, Scissors** against the computer.

### Rules of the Game

Taken from [Wikipedia][wikipedia]:

> Rock-paper-scissors is a hand game usually played by two people, where players simultaneously form one of three shapes with an outstretched hand. The "rock" beats "scissors", the "scissors" beats "paper" and the "paper" beats "rock"; if both players throw the same shape, the game is tied.

### Getting Set Up

```no-highlight
$ cd ~/challenges
$ et get rock-paper-scissors
$ cd rock-paper-scissors
```

## Meeting Expectations Requirements

* The user is playing against a computer opponent in Rock, Paper, Scissors.
* A game consists of a single round.
* The computer opponent randomly chooses between rock, paper, and scissors.
* The user chooses their shape by typing `"r"` (rock), `"p"` (paper), or `"s"` (scissors).
* Output the result of the game before exiting. Examples:
  - "Player wins!"
  - "Computer wins!"
  - "Tie!"
* If the player enters an invalid shape, print an error message.
* If both players choose the same shape, it is a tie.

### Sample Usage

Tie:

```no-highlight
$ ruby game.rb
Choose rock (r), paper (p), or scissors (s): r
Player chose rock.
Computer chose rock.
Tie!
```

Player wins:

```no-highlight
$ ruby game.rb
Choose rock (r), paper (p), or scissors (s): s
Player chose scissors.
Computer chose paper.
Scissors beats paper, Player wins!
```

Computer wins:

```no-highlight
$ ruby game.rb
Choose rock (r), paper (p), or scissors (s): s
Player chose scissors.
Computer chose rock.
Rock beats scissors, Computer wins!
```

Invalid input:

```no-highlight
$ ruby game.rb
Choose rock (r), paper (p), or scissors (s): b
Invalid entry, try again.
```

### Tips
* Feel free to use methods that have not been covered yet.  Remember, there can be many right ways to get the correct output.

* To simulate a computer picking a shape you might want to use the `rand(n)` method that randomly generates a number from 0 up to (but not including) `n`:

```ruby
rand(100) # returns a random number between 0 and 99
```

* You can check for multiple conditions in a single expression using the **or** (`||`) or **and** (`&&`) operators. The following example will check if a user typed in *foo* **or** *bar*:

```ruby
input = gets.chomp

if input == "foo" || input == "bar"
  puts "You've entered either foo or bar"
else
  puts "You didn't enter either foo or bar"
end
```

This example will check that a user typed in a number greater than or equal to zero **and** less than one hundred:

```ruby
number = gets.chomp.to_i

if number >= 0 && number < 100
  puts "You've entered a number between 0 and 100."
else
  puts "Your number was either less than 0 or equal to or greater than 100."
end
```

* You can check for several different conditions by using an `if-elsif-else` chain:

```ruby
choice = rand(4)

if choice == 0
  puts "the random number was zero"
elsif choice == 1
  puts "the random number was one"
elsif choice == 2
  puts "the random number was two"
else
  puts "everything else failed, so the random number must be three!"
end
```

[wikipedia]: http://en.wikipedia.org/wiki/Rock-paper-scissors
