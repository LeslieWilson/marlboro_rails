We've acquired some data from the Twitter Streaming API. Using React, let's create a Twitter feed to display this data. The finished website should
look like this:

![Twitter Feed 1][twitter-feed-1]

## Setup
From your challenges directory, run the following:

```sh
$ et get twitter-feed
$ cd twitter-feed
$ yarn install
$ yarn run start
```
If you go to [localhost:8080][localhost-8080], the page will display nothing, and the console will show no errors. You'll find the data for your application in `src/constants/data.js`. **DO NOT MODIFY** this data.

## Deliverables & Pro Tips

Read through **all expectations and the tips below** *before* getting started!

* To complete this challenge, you should **not** have to create additional components. Currently, we have an empty `TwitterFeed` container and `Tweet` component and that's all you need to create a functioning application.   

* Start by looking over the provided data and make sure you understand the data structure.
We can see that our `data` constant is being handed down as **props** to `TwitterFeed` from our `main.js` file. We want to render a Tweet component for each given tweet in `props.data`.   

* You should note that tweets with images contain an object which possesses a `media_url` and a `display_url`. The `media_url` is the URL to the image, so use this URL to display the image in your application. The `display_url` is a URL found in the tweet `text`. Make sure you remove the `display_url` from the tweet `text` before displaying it in your application.  

* [Foundation][foundation] and [Font Awesome][font-awesome] are available and already set up for you to use via a CDN. Rejoice! **Be sure to note we're using Font Awesome version 4.7.0** as the syntax between 4 and 5 differs!

### `Meets Expectations`
1. By mapping over the tweets provided in data, the finished application should contain a collection of `Tweet` components, one for each tweet. Make sure you import `Tweet` into `TwitterFeed`!
2. Each `Tweet` should include the user's profile picture (try using an `img` tag!), name, username, tweet content, and the "reply", "retweet", "like", and "more" icons, with numbers of retweets and replies next to those icons. **Don't worry about the date for now.**
3. You can render the icons using `FontAwesome`, which has already been made available to you within this app. (Check out the `<head>` tag in your `index.html` file) You can render icons using an `i` tag with a particular class, as displayed on each of the pages linked to below.
4. When clicking on the [reply icon][fa-reply], an alert box should pop up with the text "reply".
5. When clicking on the [retweet icon][fa-retweet], an alert box should pop up with the text "retweet".
6. When clicking on the [like icon][fa-heart], an alert box should pop up with the text "like".
7. When clicking on the [more icon][fa-ellipsis-h], an alert box should pop up with the text "more".
8. When the tweet object's `like` property is `true`, then the like icon should be red.
9. When the tweet object's `retweeted` property is `true`, then the retweet icon should be green.

### `Exceeds Expectations`
1. We want to add the date into the tweet. You have created `Date` objects in Ruby before, but now we will get some practice creating them in JavaScript. Take a look at the documentation for JS's [Date object][javascript-date], and don't forget about [parseInt()][javascript-parseint] if you need to convert strings to integers!
2. If the tweet includes a media entity, remove the corresponding `display_url` from the tweet `text` and instead, show the image in the tweet.
3. Front-end developers style their applications. You're a front-end developer. Therefore, you must style your application so it matches the mock-up.



[fa-heart]: http://fortawesome.github.io/Font-Awesome/icon/heart/
[fa-retweet]: http://fortawesome.github.io/Font-Awesome/icon/retweet/
[fa-ellipsis-h]: http://fortawesome.github.io/Font-Awesome/icon/ellipsis-h/
[fa-reply]: http://fortawesome.github.io/Font-Awesome/icon/reply/
[font-awesome]: https://fontawesome.com/v4.7.0/icons/
[foundation]: http://foundation.zurb.com/
[localhost-8080]: http://localhost:8080
[twitter-feed-1]: https://s3.amazonaws.com/horizon-production/images/twitter-feed-1.png
[javascript-date]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date
[javascript-parseint]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseInt
