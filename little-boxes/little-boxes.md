## Introduction

Some developer once said that much of web design ultimately boils down to arranging boxes full of content on a page. If you think about popular social web applications (like Facebook, the creator of React), it's easy to carve them up into a series of distinct sections, each with its own content and responsibility &ndash; you could even draw lines around them, to help visualize this.

## Learning Goals

* Practice using React components
* Learn the pitfalls of JSX
* Understand how components are imported/exported

## Setup

From your challenges directory, run the following:

```sh
$ et get little-boxes
$ cd little-boxes
$ yarn install
$ yarn run start
```

## Little Boxes on Your Website

React presentational components are great for this sort of compartmentalized design. If you open your browser up to `http://localhost:8080/`, you should now see a page with four React components: a wrapper with text, a picture, a list, and some numbers. The boxes should be arranged more-or-less like so:

![Initial boxes layout](https://s3.amazonaws.com/horizon-production/images/react-little-boxes-initial.png)

If you open up the `/src/main.js` file, you can see the components neatly arranged in the code:

```JavaScript
// src/main.js

ReactDOM.render(
  <div>
    <Wrapper />
    <Picture />
    <List />
    <Numbers />
  </div>,
  document.getElementById('app')
);
```

## And They All Look Just the Same

This a great start! But let's imagine it's not the layout our product designers want. Instead, they want to see the boxes arranged like this:

![Boxes ultimate layout](https://s3.amazonaws.com/horizon-production/images/react-little-boxes-layout.png)

Fortunately for us, since each box is its own React component, this is just a matter of moving some code around. To start with, we'll have to open up the components folder, and examine the individual component files. Let's have a look at `/src/components/Wrapper.js`:

```JavaScript
// src/components/Wrapper.js

import React from 'react';

const Wrapper = props => {
  return (
    <div className='box wrapper'>
      <h1>I Am the Wrapper</h1>
      <p>
        Lorem ipsum dolor sit amet...
      </p>
    </div>
  )
}

export default Wrapper;
```

If we modify this file, and add the `<Picture />` component somewhere inside the `return()` function, we should see it appear twice on the page &ndash; once where it did originally, and now also *inside* the Wrapper component (which moves us one step closer to what our designers intended.)

But not so fast! We'll have to remember to `import` the `<Picture />` component, in order to call upon it. Try adding the following to your `/src/components/Wrapper.js` file:

```JavaScript
import Picture from './Picture'
```

Once you've got that working, you should be able to follow the same approach to reposition each of the components. Keep refactoring until what you see on the page matches the design provided.

## This Could Be Dynamic

These components are not currently taking advantage of one of React's most-useful features: the ability to pass down information as `props`, and change what is displayed dynamically, based on what the component receives. We can fix that.

Let's look again at our `Wrapper.js` file.

Currently, the text inside of the `<h1>` and `<p>` elements are hard-coded values. But in a modern dynamic web application, we might want to re-use these components for a variety of different purposes. So let's refactor the component to display text dynamically. For example:

```JavaScript
// src/components/Wrapper.js

import React from 'react';

const Wrapper = props => {
  return (
    <div className='box wrapper'>
      <h1>{props.header}</h1>
      <p>{props.paragraph}</p>
    </div>
  )
}

export default Wrapper;
```

Remember that we'll *also* have to change our `main.js`, to give our component values for these props:

```JavaScript
// src/main.js

let wrapperParagraph = 'Lorem ipsum dolor sit amet...'

ReactDOM.render(
  <div>
    <Wrapper
      header='I Am the Wrapper'
      paragraph={wrapperParagraph}
    />
  ...
  </div>
...)
```

Do the same for the `List`, `Number`, and `Picture` components. For the `Picture` component, you can make `props` out of the URL for the `src` attribute of the `<img>` element. This will allow the `Picture` component to display almost any image you find on the web: try it, and see for yourself.

## Let's DRY It Up

So far you have made the existing four presentational components reusable, such that you *could* call on them with other data, or in other configurations, elsewhere in your hypothetical React app. But technically, each of these components is very similar to the others. Each has a title inside of an `<h1>` element, and a `className` to apply different CSS styling.

It's possible to refactor this app so that any one of the four boxes could be rendered from the same flexible presentational component, using different `props`. Let's create a new component in the `/src/components` folder, and call it `Box.js`.

```JavaScript
// src/components/Box.js

import React from 'react';

const Box = props => {
  let boxClass = `box ${props.boxClass}`

  let paragraph
  if (props.paragraph) {
    paragraph = <p>{props.paragraph}</p>
  }

  return (
    <div className={boxClass}>
      <h1>{props.header}</h1>
      {paragraph}
    </div>
  )
}

export default Box;
```

We can now replace the `<Wrapper />` in our `main.js` with this new `<Box />` component. Try it like this:

```JavaScript
// src/main.js

let wrapperParagraph = 'Lorem ipsum dolor sit amet...'

ReactDOM.render(
  <div>
    <Box
      boxClass='wrapper'
      header='I Am the Wrapper'
      paragraph={wrapperParagraph}
    />
    ...
  </div>
...)
```

Don't forget that you'll need to `import` the Box component into the `main.js` file, before invoking it within your `render()` function.

See if you can apply this same principle to refactor your new `Box` component so that it could replace *any* of the `Wrapper`, `Picture`, `List`, or `Numbers` components. You'll need to use the same conditional logic as in the provided example (`if (props.paragraph) {...}`) to return different JSX elements depending on which `props` you provide.

**Important Note:** because of the way we have nested these components inside one another in the previous steps, you will not be able to have `Box` replace all four of the existing boxes at the same time. There is a way around this limitation using a special `children` prop &ndash; but that's the subject for a different lesson.
