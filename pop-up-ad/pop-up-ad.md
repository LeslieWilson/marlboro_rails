You have sold your soul by taking a job to create a pop-up ad in React.
The pop-up ad design is the following:

![Pop-up_ad_root_image][pop-up_ad_root_image]

Your job is to set up React in your application and render the pop-up ad to the page! **To be specific, we do not need you to make this an actual pop-up module on the page: you can simply create this form on the page without popup functionality.** Don't worry too much about the styling, just work on that if you have time!

## Setup
From your challenges directory, run the following

```sh
$ et get pop-up-ad
$ cd pop-up-ad
$ yarn install
$ yarn run start
```

This will run a Webpack Dev Server with Babel.
If you go to [localhost:8080](localhost:8080), there will be nothing displayed on the page and there should be no errors in your console.

## Part 1
1) Setup your app to have React. Remember, this will involve having `ReactDOM.render` in your `main.js` that replaces a `div` in your `index.html`. You'll also need to import the correct react packages in the top of the file! Don't be afraid to look back at code examples for a `main.js` in your reading.

2) Create a stateless React component to render the HTML elements needed for the ad. Your component should be in a `src/components` folder and structured something like this:
```js
// Popup.js
import React from 'react';

const Popup = props => {
  return(
    <div>
    ...
    </div>
  );
};

export default Popup;
```

3) When you click on the [close icon][fa-times] at the top-right of the ad, you should see a [confirm][mdn-confirm] box with a message asking the user to confirm that they don't want to see Taylor Swift. Choosing "OK" or "Cancel" does not need to do anything because ads are annoying and never go away no matter how hard you try to get rid of them.

React has a slightly different way of [handling events][react-eventhandlers] than regular JavaScript. Use React event handlers for the close button and the form submission. Remember, when you define these event handlers as props on the react component, you need to give them a function to execute when the event happens. This function should have the behavior that you want to see.

This function could look something like this:

```js
// Popup.js
import React from 'react';

const Popup = props => {
  let handleExit = () => {
    confirm("Are you sure you don't want to see Tay Sway?")
  }

  return(
    <div onClick={handleExit}>
    ...
    </div>
  );
};

export default Popup;
```

4) For now, submitting the form should [stop][mdn-preventdefault] the submission event and output "Form Submitted" to the console (use `console.log`) in your Chrome Developer Tools. One day you will update this event handler to send the email to a server which spams gullible people for eternity, but today is not that day.


## Part 2
The ad has been wildly successful, and your company wants to make more of them to capitalize on the popularity of other artists. Refactor your ad component so that you can pass it the name of an artist or show as part of `props`, and have it display that instead of "Taylor Swift". Modify your `main.js` file to pass in a different name to your component. Then modify your stateless component to display the artist's name using these props.

## Optional Bonus
You are a professional front-end developer, so make sure your ad visually matches the design even though it's horrible. Again, only do this part if you feel like you have extra time! Make sure you understand the fundamentals of this exercise, mainly creating a React component, passing in props and creating an event handler before even worrying about taking this on! Just getting this article down without the styling is a huge accomplishment!

## Pro Tips
* [Foundation][foundation] and [Font Awesome][font-awesome] are available for you to use via a CDN.

[fa-times]: http://fortawesome.github.io/Font-Awesome/icon/times/
[font-awesome]: http://fortawesome.github.io/Font-Awesome/
[foundation]: http://foundation.zurb.com/
[mdn-confirm]: https://developer.mozilla.org/en-US/docs/Web/API/Window/confirm
[mdn-preventdefault]: https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault
[react-eventhandlers]: https://facebook.github.io/react/docs/handling-events.html
[pop-up_ad_root_image]: https://s3.amazonaws.com/horizon-production/images/pop-up_ad_root.png
