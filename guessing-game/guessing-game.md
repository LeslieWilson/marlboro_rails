## Part 1

Time to move on from the vending machine business and into the game development
industry. Those fancy programs with graphics are overrated - let's use the
command line for our first debut game. Your game should do the following:

1. Ask the user what difficulty they would like to play at - "easy" or "hard".
2. Accept user input and save it as a variable.
3. Pick a random number. If the user chose "easy", the number should be between 1 and 10. If the user chose "hard", the number should be between 1 and 20.
4. Depending on which level the user chose, say that you picked a random number between 1 and 10 or 20, and that the user now has to guess it.
5. Start a while loop. The while loop should run for as long as the user hasn't found the correct answer. Each time the loop runs, the user should be asked to pick a number. As long as the answer isn't correct, the user should be asked to try again.
6. After the user has found the correct answer, the loop should exit and a congratulatory message should display.

#### Sample Output:

```
Welcome to the Guessing Game! What difficulty would you like to play?
Type easy or hard:
> easy
I've picked a number between 1 and 10. Now guess it!
> 7
Nope, try again!
> 3
Nope, try again!
> 5
You win! Nice job!
```

## Part 2

You've decided that to make the game more exciting, you should really keep track of how many guesses it takes the player to find the number. That way the future diehard fans can compete to get the best high scores.

Update the code you wrote above to accomplish this. Create a variable representing score at the top of your code. Each time the user make a guess in your while loop, increment their score by 1. At the end, print out their total score so they know how they did!

#### Sample Output:

```
Welcome to the Guessing Game! What difficulty would you like to play?
Type easy or hard:
> easy
I've picked a number between 1 and 10. Now guess it!
> 7
Nope, try again!
> 3
Nope, try again!
> 5
You win! Nice job!
Your score was: 3
```

## Part 3

What sort of programmer would you be if you can't cheat at your own game?

Insert a `binding.pry` to your program and use it to "guess" the number correctly on the first try when run your code.


### Video Solution

{% show_solution %}
{% vimeo_video "124960988" %}
{% endshow_solution %}
