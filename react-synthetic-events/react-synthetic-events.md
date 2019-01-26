## Learning Objectives

* Implement synthetic events in React
* Use React synthetic events to respond to user interaction

## Following Along

In this lesson, we will be working from a pre-built application.

Perform the following steps to get started:

```sh
$ cd ~/challenges
$ et get react-synthetic-events
$ cd react-synthetic-events
$ yarn install
$ yarn run start
```

## Project Description

At Launch, when a peer overcomes challenges or goes out of their way for their colleagues, we like to thank them by awarding them karma points.

With that in mind, we will be building a Karma Tracker. In this application, we enter a name into the form, hit the `Add Karma ++` button, and see an alert with that person's Karma level.

A few things before we get into that...

## What Are Synthetic Events?

Up to this point, you've responded to user interactions by manipulating DOM elements, probably with something like `click`:

```
let changeFontColor = (event) => {
  let colors = ['Aqua', 'Blue', 'Cyan', 'Green', 'LightGray', 'LightSteelBlue']
  let index = Math.floor(Math.random() * colors.length)
  let color = colors[index]
  event.srcElement.style.color = color
}

let paragraph = document.getElementById('moby-dick-chapter-1')
paragraph.addEventListener('click', changeFontColor, false)
```

React events, when specified in JSX, allow us to respond to user interactions in a similar way, but there are some small differences:

* React's synthetic events are named using *camelCase* (`onClick`) rather than lowercase (`onclick`).
* You'll wind up passing a function, rather than a string (such as `click` above), as the event handler.

## Implementing Synthetic Events

When we add event handlers to our JSX elements, synthetic events are treated as props, or attributes, on HTML elements like `onClick`.

```sh
<div onClick={someFunction} />
```

Creating an event handler for a React component usually requires doing the following:

* Defining a function
* Passing that function down to the component that triggers that event

Let's try a few examples, using our Karma Tracker!

## onClick

Using the `onClick` event, you can issue a response when a user clicks on a React element. Let's add an event handler that issues an alert when a user clicks on the `Add Karma ++` button (defined by our `KarmaButton` component).

First, inside your `App` component, before the `return`, define a `karmaAlert` function that takes `event` as an argument.

```sh
let karmaAlert = (event) => {
}
```

And, within that function, add an `alert`:

```sh
let karmaAlert = (event) => {
  alert("You have leveled up! (Karma: 1)");
}
```

Now, the component that's going to actually _respond_ to the user's click is the `KarmaButton` component. So it makes sense to pass the `karmaAlert` function down to the `KarmaButton` component.

Inside our `App` component's `return`, the `KarmaButton` is referenced using JSX. Update that reference so it looks like this:

```sh
<KarmaButton karmaAlertProp={karmaAlert} />
```

What we're doing here is actually adding a property called `karmaAlertProp` to the `KarmaButton` component itself. That prop stores the `karmaAlert` function we just defined.

Moving over to `KarmaButton.js`, we can now add an `onClick` to the appropriate `div`, which will _listen_ for a user clicking on the button.

We can then reference `props.karmaAlertProp` to grab the function that's now living inside this component's props, and include it with our `onClick`!

```
import React from 'react';

const KarmaButton = (props) => {

  return (
    <div className="row">
      <div className="small-12 small-centered columns text-center" onClick={props.karmaAlertProp}>
        <button className="button large expand">Add Karma ++</button>
      </div>
    </div>
  );
}

export default KarmaButton;
```

Refresh the page. When you click on the button, you should now see an alert popping up with your karma level!

## onChange

Any event handlers passed to `onChange` fire straightaway when the value of an element is changed. This is useful, for instance, when a user types into a form field.

Let's add a function that allows us to print the values of our form input to the console.

Inside our `App` function, before the `return`, add:

```sh
let formChanger = (event) => {
  console.log(event.target.value);
}
```

`event.target` allows us to reference the object that triggered the event. In this case, it's going to be the `input` part of our form: `<input type="text">`. We're then able to grab the value of whatever we enter into the form by using -- you guessed it -- `event.target.value`.

But, in order to make this happen, we need to pass our function down to our `NameForm` component!

Inside our `App` component's `return`, the `NameForm` -- similar to the `KarmaButton` -- is referenced in JSX tags. Add a new prop to that reference so it looks like this:

```sh
<NameForm formChangerProp={formChanger}/>
```

Now, let's head over to our actual `NameForm.js` and update the `input` part of the form:

```sh
<input type="text" onChange={props.formChangerProp} />
```

Open up your JS console and type your name into the field. You should see the changes print, incrementally, each time you add a character:

```
L
La
Lau
Laun
Launc
Launch
Launche
Launcher
```

Cool, right?

This will become even handier when we move on to _stateful_ components and want to directly update our applications based on user input!

## onSubmit

What if we want to take action when the user _submits_ the form rather than with each change to the form input? We can take advantage of the `onSubmit` event.

Let's change our functionality a bit so we can print something to our console _after_ the form has been submitted.

In your `App.js`, update the `formChanger` function slightly, so it looks like this:

```sh
let formChanger = (event) => {
  event.preventDefault();
  console.log("Form submitted!");
}
```

Next, remove the `onChange` event from the `NameForm` component and add an `onSubmit` to the opening `form` tag, as such:

```sh
<div>
  <h3 className="text-center">Enter your name here</h3>
  <form onSubmit={props.formChangerProp}>
    <div className = "row">
      <div className = "small-4 small-centered columns text-center">
        <input type="text" />
        <input className="submit-button" type="submit" />
      </div>
    </div>
  </form>
</div>
```

Keep your JS console open, and fill in the form. When you hit the "submit" button, you should see "Form submitted!" printed to the console!

## A Note About `preventDefault()`

For links and buttons, `preventDefault()` will eliminate the default behavior of the browser (i.e., a form being submitted, a link sending a user to a different page).

This becomes incredibly useful when you want to use a link to trigger a _different_ action, like changing the color of an element or something wacky like that!

## Other Types of Events

You've learned a few events that allow React to listen for user actions and trigger responses based on those interactions. [Here](https://facebook.github.io/react/docs/events.html#clipboard-events) are some more:

*Clipboard events:*

* `onCopy`
* `onCut`
* `onPaste`

*Keyboard events:*

* `onKeyDown`
* `onKeyPress`
* `onKeyUp`

## Summary

You have now used some of the most common React events: `onClick`, `onChange`, and `onSubmit`. These can greatly enhance user experience as visitors to your site fill out registration forms, click on menu items, attempt to purchase things, and the like! The beauty of React events is that users can get real-time, instant feedback as they navigate through your site.

"Props" to you!

### External Resources

* [SyntheticEvent - React](https://facebook.github.io/react/docs/events.html)
* [Handling Events - React](https://facebook.github.io/react/docs/handling-events.html)
* [Events in React](https://www.kirupa.com/react/events_in_react.htm)
