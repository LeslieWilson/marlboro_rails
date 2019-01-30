import React from 'react';



const data = [
  {
    id_str: '725090047557558272',
    text: 'When people say setState() is an anti-pattern, they mean 500-line components with a complex setState() soup scattered across event handlers.',
    user: {
       name: 'Dan Abramov',
       screen_name: 'dan_abramov',
       profile_image_url: 'https://s3.amazonaws.com/horizon-production/images/twitter-feed-dan-abramov.jpeg'
    },
    retweet_count: 14,
    favorite_count: 34,
    entities: {},
    favorited: false,
    retweeted: false,
    timestamp_ms: '1461709913000'
  },
  {
    id_str: '725028750535102466',
    text: 'Passing functions as arguments v. calling them is one of the most common confusions in our workshops:\n\nfn(otherFn) v. fn(otherFn())',
    user: {
       name: 'Ryan Florence',
       screen_name: 'ryanflorence',
       profile_image_url: 'https://s3.amazonaws.com/horizon-production/images/twitter-feed-ryan-florence.jpg'
    },
    retweet_count: 254,
    favorite_count: 935,
    entities: {},
    favorited: true,
    retweeted: false,
    timestamp_ms: '1461695299000'
  },
  {
    id_str: '1461003902000',
    text: "I'd say that it is best practice to make all prop types required in React and provide defaultProps for those that are not.",
    user: {
       name: 'Sebastian Markbåge',
       screen_name: 'sebmarkbage',
       profile_image_url: 'https://s3.amazonaws.com/horizon-production/images/twitter-feed-sebastian-markbage.png'
    },
    retweet_count: 46,
    favorite_count: 105,
    entities: {},
    favorited: false,
    retweeted: true,
    timestamp_ms: '1461003902000'
  },
  {
    id_str: '702194866168528896',
    text: '"Is React Native ready for production? Yes" - @JI pic.twitter.com/EgRMriTgMz',
    user: {
       name: 'React.js Newsletter',
       screen_name: 'reactnewsletter',
       profile_image_url: 'https://s3.amazonaws.com/horizon-production/images/twitter-feed-reactjs-newsletter.png'
    },
    retweet_count: 21,
    favorite_count: 18,
    entities: {
      media: [
        {
          media_url: 'https://s3.amazonaws.com/horizon-production/images/twitter-feed-reactjs-newsletter-media.jpg',
          display_url: 'pic.twitter.com/EgRMriTgMz'
        }
      ]
    },
    favorited: false,
    retweeted: false,
    timestamp_ms: '1456251276000'
  },
  {
    id_str: '702258314550202369',
    text: "How Netflix's UI team achieved to hit a quite challenging performance target by Steve McGuire pic.twitter.com/deRZ7UbabA",
    user: {
       name: 'React',
       screen_name: 'reactjs',
       profile_image_url: 'https://s3.amazonaws.com/horizon-production/images/twitter-feed-react.png'
    },
    retweet_count: 20,
    favorite_count: 47,
    entities: {
      media: [
        {
          media_url: 'https://s3.amazonaws.com/horizon-production/images/twitter-feed-react-media.jpg',
          display_url: 'pic.twitter.com/deRZ7UbabA'
        }
      ]
    },
    favorited: true,
    retweeted: true,
    timestamp_ms: '1456266404000'
  },
];







export default data;
