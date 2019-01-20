# Grocery List Time!

Refactor a React Grocery List app to use nested components.


## Getting Started

Run the following commands and visit <http://localhost:8080> to see the current state of the application.

```sh
$ et get react-grocery-list
$ cd react-grocery-list
$ yarn install
$ yarn run start
```

You should see the following static application in your browser:

![Grocery List React No Styling][grocery-list-react-no-styling]

Right now the app displays and the buttons create an alert when clicked, but it does not make good use of React's component structure.
Your task is to **break the application up into smaller, nested React components**. This is what your
React component stucture should look like with the nesting. Note the components that you are going to have to make
and make sure that you import and export them!

```no-highlight
App
  └── GroceryList
        └── Grocery
```

Your `App.js` file will end up looking something like this:

```javascript
// src/components/App.js
import React from 'react';
import GroceryList from './GroceryList';

const App = props => {		
  let groceryData = [		
    { id: 1, name: "Oranges" },		
    { id: 2, name: "Bananas" },		
    { id: 3, name: "Bread" }		
  ];

  return(
    <div>
      <h1>Grocery List</h1>

      <GroceryList 
        groceries={groceryData} 
        handleButtonClick= { (event) => { alert('Button was clicked')} }
      />
    </div>
  )
};

export default App;
```

`props` are passed down to the `GroceryList` and `Grocery` components in order to
set their attributes.

Your `GroceryList` component should also make use of the `.map` function to create a collection of React `Grocery` components.


{% show_hint %}

* Create files for the `GroceryList` and `Grocery` components in the `src/components` folder.
* Make sure to `export` the components at the end of the files
* `import` these components in the `App.js` file.
* Utilize `props` to set the attributes on the `GroceryList` and `Grocery` components.
* The `groceryData` would be good data to `.map` over in the `GroceryList` component!

{% endshow_hint %}


### External Resources

* [React Docs: Interactivity and Dynamic UIs][react-interactivity-and-dynamic-uis]
* [React Docs: Thinking In React][react-docs-thinking-in-react]

[grocery-list-react-no-styling]: https://s3.amazonaws.com/horizon-production/images/grocery_list_react_no_styling.png
[react-docs-thinking-in-react]: https://facebook.github.io/react/docs/thinking-in-react.html
[react-interactivity-and-dynamic-uis]: http://facebook.github.io/react/docs/interactivity-and-dynamic-uis.html
