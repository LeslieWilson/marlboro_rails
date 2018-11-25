You have been commissioned by the premier League of Cool Kickball Professionals (LACKP) to build their first website. Lucky you!

### Learning Objectives

* Build a Sinatra application to serve dynamically generated HTML.

### Tips for navigating through the application

Take special note of the file structure of this challenge, which may be new to you. In our [Dynamic Web Pages with Sinatra][dynamic-web-pages-with-sinatra] reading, we generated HTML using ERB templates. However, we included the entirety of the HTML code in each of our ERB files that we put in our `views` folder, which meant we were repeating a lot of code, especially the entire `<head>` section.

In this assignment, we have minimized repetition by putting a `layout.erb` file in our `views` folder, which gives us the general structure and header of the HTML. Within this template, you will see a line that says `<%= yield %>`, which indicates to the file that it needs to find an additional ERB template to fill this space (whether it is an `index`, `show`, or other template). Based on your `server.rb` file, Sinatra will know to include the HTML outline from `layout.erb`, and fill in the appropriate HTML within the body.

The `server.rb` is where you will be writing code to configure the logic for each of the paths a user visits. Specifically, this is where you will prepare the data needed for a specific webpage, and specify which ERB template should be used. This will be the first step in setting up each webpage.

You will need to access the files in the `models` folder in order to retrieve the team data for your website (for the first two user stories, you can start by accessing `models/league.rb`). Your `server.rb` file is already set up to require each of the files in `models` via `require_relative`, so that you can use those classes in your `server.rb`.

Once your `server.rb` file is set up, you will need to create your ERB templates for each page. Any new ERB templates you create should also be placed in the `views` folder. In order to visit a specific team's page, you can utilize the `params` hash to tell your `server.rb` file which team page to visit. Your app, however, should only have one generic path, `/team/:team_name` or `/team/:team` to access any team's show page.

Unless you wish to configure JavaScript or styling, you will not need to edit the files in the `public` folder.

### Instructions

#### Set up the required web pages

The application should satisfy the following user stories:

```no-highlight
As a Kickball Fan
I want to view a page with the names of each team
So that I can learn which teams are in the league
```

Acceptance Criteria:

* When I visit `/teams` I can see list of all the team names
* This list should link to individual team pages (individual team pages will be implemented in a subsequent story)

```no-highlight
As a Kickball Fan
I want to view the professional teams
So that I can learn more about the players
```

Acceptance Criteria:

* I can navigate to a distinct url and web page for each team
* Each team page displays the team's name
* Each team page displays each player's name along with their position
* Given that I am on the `/teams` page, I can get to a specific team's page by clicking on the name of the team

#### Create and utilize objects

Write unit tests for the following classes and implement them. These files have been created for you in the `models` folder. Note that there are some spec files available to help drive your code through Test Driven Development! Be sure to write these tests prior to creating your classes.

##### `Player` class
* `Player` objects should be initialized with a `name` and `position`. These attributes should have reader methods associated with them.

##### `Team` class
* `Team` objects should be initialized with a `name` and a list of player data. The constructor should instantiate a list of player objects.
* Once properly assigned in the constructor, the list of player objects will be
    accessible via the `players` `attr_reader` that has already been set up for
    you.

Once you have successfully implemented these classes, you should utilize them in your app. For example, in your `/teams` route, you can set `@teams = Team.all`, and so you can iterate through the `@teams` array in your view and display each team name.

### Optional Challenges
#### Implement features that satisfy the following user stories

```no-highlight
As a Kickball Fan
I want to view a page with the names of each position
So that I can learn what positions there are on a team
```

Acceptance Criteria:

* When I visit `/positions` I should be able to see list of all the positions.

```no-highlight
As a Kickball Fan
I want to see all players in a certain position
So that I can see who plays each position in the league
```

Acceptance Criteria:

* I can navigate to a distinct url for each position
* Each position page displays the position
* Each position page lists each player in that position along with their team name
* Given that I am on the `/positions` page, I can get to this page by clicking on the name of the position


[dynamic-web-pages-with-sinatra]: https://learn.launchacademy.com/lessons/dynamic-web-pages-with-sinatra
