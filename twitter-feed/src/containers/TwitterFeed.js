import React from 'react';
import Tweet  from '../components/Tweet';


const TwitterFeed = (props) => {

let tweets = props.data.map(tweet => {
    return(
        <Tweet
        key = {tweet.id_str}
        userName={tweet.user.name}
        screen_name={tweet.user.screen_name}
        profile_img={tweet.user.profile_image_url}
        txt={tweet.text}
        retweet_count={tweet.retweet_count}




        />
    )
})

return(
    <div>

    {tweets}

    </div>
)};


export default TwitterFeed;
