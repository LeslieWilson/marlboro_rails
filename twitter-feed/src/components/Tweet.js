import React from 'react';




const Tweet = props => {
    let descriptionAlert = () => alert(props.descr);
    return(
        <div onClick={descriptionAlert} >
        <div className='userName'>
        {props.userName}
        </div>
        <div className='txt'>
        {props.txt}
        </div>

        <img className='profile_img' src={props.profile_img}
        />

        
        <div className='retweet_count'>
        {props.retweet_count}
        </div>


</div>






    );
};



export default Tweet;
