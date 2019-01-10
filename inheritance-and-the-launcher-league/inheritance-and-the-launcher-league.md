Trouble at Mission Control! The Dastardly Force-Push has erased the basic methods from the heroes of the Launcher League! And the only one who can save them... is you!


## The Launcher League

in `code.rb`, you'll find a `SuperHero` class with a number of methods. Underneath, you'll find six classes that inherit from `SuperHero`, describing the various superhero archetypes that the Launcher League generally consists of - a `Brawler`, a `Speedster`, etc.

It is your job to edit those child classes to restore the Launcher League to their former glory.

- All of the child classes have a power, a weakness, and a backstory.  Feel free to embellish.
- `Speedster`-s run 1000 times as fast as a normal `SuperHero`!
- The `Brawler` is 20 times as healthy as a normal `SuperHero`!
- The `Detective` weakness is their own `secret_identity`!
- The `Detective` is also slow - they are 1/6th as fast as their fellow superheroes.
- The `Demigod`'s home is on the "Cosmic Plane".
- The `JackOfAllTrades` isn't a Human - they're an "Alien", and their home is "Venus"!
- `Waterguy` only has 5 fans per thousand. Poor `Waterguy!``
- Maybe that's because `Waterguy`'s home is "Earth's Oceans"?
- At least `Waterguy` is Psychic, as is the `JackOfAllTrades`.

Where you can, consider using the `super` keyword to interact with the default value of methods on the parent class instead of hard-coding the math in the child classes with an overwrite.

First, run `bundle` to set up your development environment correctly. We've given you access to `pry`, so I recommend you dig around in the internals of the child classes to make sure they're doing what we expect.

You can run the specs in `specs` to test the instances of your new classes to make sure they measure up.

Good Luck, Launchers! The Launcher League's fate rests in your terminal.
