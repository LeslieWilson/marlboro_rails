import React from 'react';




const Tweet = props => {
    let descriptionAlert = () => alert(props.descr);
    return(
        <div onClick={descriptionAlert} >
<div className='top'>
        {props.userName}
        </div>
        {props.txt}
        {props.profile_img}
        {props.retweet_count}
</div>






    );
};



export default Tweet;
