import React from 'react';




const Tweet = props => {
    let descriptionAlert = () => alert(props.descr);
    return(
        <div className='tweet' onClick={descriptionAlert}>


        <img className='profile_img' src={props.profile_img}
        />

<div className='headers'>
        <div className='userName'>
        {props.userName}
        </div>


        <div className='screen_name'>
        {props.screen_name}
        </div>

        <div className='timestamp_ms'>
        
        {props.timestamp_ms}
        </div>
</div>

        <div className='txt'>
        {props.txt}
        </div>

        <div className='retweet_count'>
        {props.retweet_count}
        </div>

        <div  className='favorite_count'>
        {props.favorite_count}
        </div>
</div>






    );
};



export default Tweet;
