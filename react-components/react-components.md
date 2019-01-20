## Learning Objectives

* Learn how to use React components
* Understand how data is passed into and used within Components

## Following Along - Code Example

To get quickly set up, run the following:

```sh
$ et get react-components
$ cd react-components
$ yarn install
$ yarn run start
```

## React Components

React Components often need to be dynamic and respond to user interface (UI) events, server events, and even the passage of time.
Thus, we need a way for components to update what they render under different circumstances. This is dependent on the data associated to our React Components.

To begin our dive into React Components, we begin with the following two files:

```javascript
// src/main.js
import React from 'react';
import ReactDOM from 'react-dom';
import MessageComponent from './components/MessageComponent';

ReactDOM.render(
  <MessageComponent />,
  document.getElementById('app')
);
```

```javascript
// src/components/MessagesComponent.js
import React from 'react';

const MessageComponent = props => {
  return(
    <div>
      <h1>Component Message: Hi!</h1>
    </div>
  );
};

export default MessageComponent;
```

Booting up our Webpack Dev Server and going to <http://localhost:8080> will display the following in the browser:

![React Stateless Components Photo 1][react-stateless-components-photo-1]

One important aspect of interactive User Interfaces (UIs) is the storage of data. With React Components, there are two main ways of storing data, with the first being through the use of static properties, also known as `props`.

## React Props

Properties, or `props`, can play two roles. The first is to give a JSX tag an HTML property, such as `id`, `className`, or define event handlers, or define other html properties. However, `props` can also be used for data flow into React Components. Props are
key-value pairs of information passed down to components. You are able to define the key and value yourself. In the example
below the `prop` of `message` has a value of `"Hello from main.js"`.

When we want to pass information about what our `MessageComponent` will say, we must start from the file which calls and utilizes an instance of the component.
Here is an example of passing data into a `MessageComponent`:

```javascript
// src/main.js
import React from 'react';
import ReactDOM from 'react-dom';
import MessageComponent from './components/MessageComponent';

ReactDOM.render(
  <MessageComponent message="Hello from main.js" />,
  document.getElementById('app')
);
```

`<MessageComponent message="Hello from main.js" />` is calling an instance of a `MessageComponent` with a property of `message="Hello from main.js"` as opposed to solely a props-less `MessageComponent` we had before: `<MessageComponent />`.

Booting up our Webpack Dev Server and going to <http://localhost:8080> will display the following in the browser:

![React Stateless Components Photo 1][react-stateless-components-photo-1]

What gives? We have explicitly changed the message we want to show in `main.js`, but we haven't yet displayed the `props` we passed down from within our `MessageComponent` component. Let's take a dive into the `MessageComponent` file and see where props lives. Let's add a `debugger` right before the `return` call within our render method:

```javascript
// src/components/MessageComponent.js
import React from 'react';

const MessageComponent = props => {
  debugger;
  return(
    <div>
      <h1>Component Message: Hi!</h1>
    </div>
  );
};

export default MessageComponent;
```

If we check what `props` is in the console, you should see the following result:

![React Stateless Components Photo 2][react-stateless-components-photo-2]

As you can see, the message property passed in from `main.js` is now available as a key value pair within `props`. This is the main workflow for passing data to a component.

We can now use a JSX expression to display the message from `props`, instead of hard-coding the message:

```javascript
// src/components/MessageComponent.js
import React from 'react';

const MessageComponent = props => {
  return(
    <div>
      <h1>Component Message: {props.message}</h1>
    </div>
  );
};

export default MessageComponent;
```

Here we are calling the `message` key from `props` to display the value as the component message. We should see the following changes updated in the browser:

![React Stateless Components Photo 3][react-stateless-components-photo-3]

`props` are considered to be static; they cannot be changed. You cannot and should not change the `props` in the child component (`MessageComponent` in this case). If you want to change props, you need to change them in the parent file that is handing it down (in the `main.js` file here). When the data in our application changes, how can we update a component to show the latest information? Luckily, there is a second form of data storage on React Components known as `state`. We will be covering state later on in React week, so do not worry about it for now.

Components without state, that only have data being passed down through `props` like the `MessageComponent` above are called **Stateless Components**.

## Summary

React components allow us to make our pages dynamic so they respond to UI events, server events, and the passage of time.
These components take in two forms of data. `props` comes from information passed into the instance of the component and remains static throughout an applications lifespan.
`state` on the other hand, can be changed. Components that do not have state in them are called **stateless components**.

### External Resources
* [React Docs: Thinking In React][react-docs-thinking-in-react]

[localhost-8080]: http://localhost:8080
[react-blog-es6-syntax-announcement]: https://facebook.github.io/react/blog/2015/01/27/react-v0.13.0-beta-1.html#plain-javascript-classes
[react-docs-thinking-in-react]: https://facebook.github.io/react/docs/thinking-in-react.html

[react-stateless-components-photo-1]: https://s3.amazonaws.com/horizon-production/images/react-stateless-components-photo-1.png
[react-stateless-components-photo-2]: https://s3.amazonaws.com/horizon-production/images/react-stateless-components-photo-2.png
[react-stateless-components-photo-3]: https://s3.amazonaws.com/horizon-production/images/react-stateless-components-photo-3.png
