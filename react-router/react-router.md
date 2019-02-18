## Learning Objectives

* Understand how URLs work within a web application
* Learn how to create links, nested routes, and back buttons for rendering React components

## Following Along

From your challenges directory, run the following:

```sh
$ et get react-router
$ cd react-router
$ bundle install
$ ruby server.rb
```

In another terminal tab, run:

```sh
$ yarn install
$ yarn run start
```

At this point, `ruby server.rb` is running in one tab and `yarn run start` is running in another. Navigate to http://localhost:4567/ to see our app. You should see a lovely cereal wallpaper on the page with no errors displayed in the console.

We are in the middle of building a React and Sinatra app for our favorite breakfast cereals, and we need your help! Here are our requirements:

* The homepage will show an index page (a list) of cereals.
* Clicking on a cereal should update the URL from `/` to `/cereals/:id`, and we should be able to view additional information for a particular cereal.
* A nav bar should be present on every page.
* Clicking the back button should take us back to the previous page we were just looking at, and update our URL appropriately.

Let's get started! But first...

## What is React Router, anyway?

Router is a library built on top of React which allows you to quickly add multiple pages and flows of information and to keep the browser in touch with what's being displayed on the page. At a lower level, Router is really just a _component_ that loads other components based on the URL.

Among the many reasons why Router is great: You can create links to other parts of your React app, nest routes, and use JavaScript to update the URL without making an HTTP request. Router also allows you to use dynamic routing, rather than manually coding the links in your app, and gives your React app access to `params`, just like in your Sinatra apps.

Going a step further, creating distinct URLs for different "pages" in your web application also means that you can link directly to a specific page _section_ when sending out links to others. For instance, if you wanted to link to a _particular_ cereal page you could do so easily. This is otherwise very difficult to do in React since you often are only serving up a single page from the server with all the JavaScript code.

## Mapping URLs to React Components

You're already familiar with the idea of having a top-level `App` component that `render`s another `container` component. Now, instead of just choosing which component `App` renders, we're going to use Router to _conditionally_ render components based on the url currently in the browser. You do this by having your `App` component render a `Router` imported from `react-router`.

We're also going to import `browserHistory` from `react-router`. `browserHistory` uses the [History API](https://developer.mozilla.org/en-US/docs/Web/API/History) built into the browser to create clean, easy-to-read URLs. This contrasts with the older version `hashHistory` which has a much uglier, hard to understand URL (it adds a key like `_k=123abc` to the end of your URL so it can find the correct page). If we remember that React creates a _virtual DOM_ on top of our webpage, we can think of `browserHistory` as a way that our virtual DOM communicates with the actual session history of our browser.

By doing this, you're giving Router instructions about how to match the URL in your browser, and about what component to display when the URL matches.

Replace the code in `react/src/App.js` with the following:

```js
import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import NavBar from './components/NavBar';
import BreakfastCerealsContainer from './containers/BreakfastCerealsContainer';
import BreakfastCerealShowContainer from './containers/BreakfastCerealShowContainer';

const App = props => {
  return(
    <Router history={browserHistory}>
      <Route path='/' component={NavBar} >
        <IndexRoute component={BreakfastCerealsContainer} />
        <Route path="cereals/:id" component={BreakfastCerealShowContainer}/>
      </Route>
    </Router>
  )
}

export default App;
```

and the empty void in `react/src/NavBar.js` with the following:

```js
import React from 'react';
import { Link } from 'react-router'
import BackButton from './BackButton'

const NavBar = props => {
  return(
    <div>
      <div className="navbar">
        <Link to='/'>All Cereals</Link>
      </div>
      <div className="content">
        <h1 className="page-title">Cereals</h1>
        {props.children}
      </div>
    </div>
  )
}

export default NavBar;
```

So what's going on here? We're setting up our `App` component and giving it `browserHistory` so that our App can keep track of which URL we are visiting. We are also defining a root path, and saying that it should render our `NavBar` component, which will display our nav bar. Inside our root path, we are _nesting_ an `IndexRoute`, so that our `BreakfastCerealsContainer` will display below our `NavBar` component. The `IndexRoute` allows us to render a child component (`BreakfastCerealsContainer`) for a parent route, in this case, the root path (`'/'`).

It is **extremely** important to note here that child components in React Router display **inside** of their parent components. This means in our case that both the `NavBar` component and the `BreakfastCerealsContainer` will be on the page **together** at the root path. If we go to the path `/cereals/2`, both the `NavBar` and `BreakfastCerealShowContainer` will be on the page.


Also, as you create URLs, you need to create a corresponding URL in your server file (`server.rb`). Each of these routes must serve up the JavaScript application (the view with the `div` that your ReactDOM.render is replacing). You need to do this in case a user visits the URL of a piece of your app directly. The server has to serve up the HTML file with the JavaScript the first time, then the React app is on the page and Router can work its magic. Otherwise, the server will respond with a 404 error and have no idea what files to serve up.

A few things to note:

* Most of the components that get passed into our `Route` components tend to be "containers" that store the state for each page (or URL) in our app, rather than stateless, presentational components. If you want these presentational components that are further down the tree to have access to `params`, you can pass them down as `props`.
* The API endpoints that we use to fetch our data (i.e., `/api/v1/cereals` in the `BreakfastCerealsContainer`) only need to be defined inside our Sinatra `server.rb` file. We do not tell Router to listen to those.

At this point, try visiting `localhost:4567`. You should see some `CerealTile` components rendered to the page.

## Creating Links in our Nav Bar

To create links between pages in our application, we will use React Router's `Link` component, which performs similarly to an anchor tag (`<a>`), except that it's aware of its Router context. Clicking on a `Link` component will take you to the specified part of your React app without making an HTTP request. You can also use it to dynamically create links.

We've built a simple nav bar in `NavBar.js` with a `Link` to the homepage. Because the rest of our app is a child of this `NavBar` component, the nav bar will display at the top of every page. The `props.children` within the `return` of `NavBar.js` is the child component that React Router renders based on which child route it matches. For example, if we go to the `/` path, `props.children` will be the `BreakfastCerealsContainer` thanks to our `IndexRoute`. However, if we go to the `/cereals/2` path, `props.children` will be equal to the `BreakfastCerealShowContainer`.

Here, we're providing a `Link` to our homepage from the nav bar and a title. As your website grows, you could add more links to this NavBar and create a fully fledged nav bar, but to keep things basic for the purposes of this article, we'll just have a link back to home.

## Creating Dynamic Links to a Particular Cereal's Page

Let's update our `CerealTile` component so that, when we navigate to the index page and click on the first cereal we see, the URL will dynamically update to something like `/cereals/1`. Within `CerealTile.js`, add the following line to the div that has a `className` of `cereal` to replace the regular `<h1>`:

```js
// CerealTile.js

...
  <Link to={`/cereals/${props.id}`}><h1>{props.name}</h1></Link>
...
```

Using `props` and string interpolation, we are creating a dynamic link to each show page so that we don't have to manually define links to each cereal. This way, whenever we click on the name of a cereal from our index page, the URL will update and give us more information about that particular cereal.

## Using Nested Routes

But what's that `NavBar` component all about?

As we discussed earlier, it probably makes sense to have our nav bar (even if it does nothing else but link back to our homepage, at the moment) present on every page, so we need to find a way to share that bit of UI. It also helps to keep our app nice and organized. Next, in order to force all of our pages to render the nav bar, we nest all the other routes below the one that renders it. The `props.children` line in `NavBar.js` allows us to render "children" components in addition to our ubiquitous nav bar.

React is often referred to as a series of "boxes within boxes," and it's a pretty apt metaphor. Putting routes inside other routes allows us to have greater control over which UI is rendered where.

## Implementing Back Buttons

Let's say we've checked out the reviews for a new cereal, and we want to navigate back to our master list of cereals. `browserHistory` lets us do this, and gives us a `.goBack()` function, allowing us to go back to our previous page or URL in our browser's history.

Let's add a back button to our nav bar to make our app more user-friendly. Inside `BackButton.js`, add:

```js
import React from 'react';
import { browserHistory } from 'react-router'

const BackButton = () => {
  return(
    <div className="back-button">
      <button onClick={browserHistory.goBack}>Back</button>
    </div>
  )
}

export default BackButton;
```

Then, inside the nav bar in `NavBar.js`, add the `BackButton` component to your nav bar. Your finished nav bar should look like this:

```js
import React from 'react';
import { Link } from 'react-router';
import BackButton from './BackButton.js';

const NavBar = props => {
  return(
    <div>
      <div className="navbar">
        <BackButton />
        <Link to='/'> HOME </Link>
      </div>
      <div className="content">
        <h1 className="page-title">Cereals</h1>
        { props.children }
      </div>
    </div>
  )
}

export default NavBar;
```

The Back Button component, at this point, should essentially behave the same as the "back" button for the native browser, but without the page reloads. Especially in larger apps, it's useful when you want to go back to the previous page in the session history.

## Summary

React Router is a library built on top of React that allows us to quickly and easily create a smooth navigation experience within our React app. We can use `Link`, `Route`, and `IndexRoute` -- and nested routes -- to further customize our UI. We use API endpoints to fetch our data via containers, and we include links to views in our Routes.

Importantly, nested routes and `props.children` allows us to render "children" components in addition to whatever is in our parent component (`NavBar` in this case).

Please note that this lesson has focused on React Router v3. React Router v4 has some significant changes, so just beware of versioning.

### External Resources

* [Original Repo (From EE Legend Jenn Eng)](https://github.com/jennceng/bar_reviews_react_router)
* [ReactTraining/React Router](https://github.com/ReactTraining/react-router)
* [ReactJS/React Router Tutorial](https://github.com/reactjs/react-router-tutorial)
