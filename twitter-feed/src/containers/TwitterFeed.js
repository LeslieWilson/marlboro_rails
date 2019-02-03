import React from 'react';
import Tweet  from '../components/Tweet';


const TwitterFeed = (props) => {

let tweets = props.data.map(tweet => {
    return(
        <Tweet
        key = {tweet.id_str}
        profile_img={tweet.user.profile_image_url}
        userName={tweet.user.name}
        
        timestamp_ms={tweet.timestamp_ms}
        screen_name={tweet.user.screen_name}
        txt={tweet.text}
        retweet_count={tweet.retweet_count}
        favorite_count={tweet.favorite_count}


        />
    )
})

return(
    <div>

    {tweets}

    </div>
)};


export default TwitterFeed;
