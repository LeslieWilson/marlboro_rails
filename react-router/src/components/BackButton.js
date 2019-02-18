import React from 'react';
import {broswerHistory} from 'react-router'

const  BackButton = () => {
    return(
        <div className="back-button">
        <button onClick={browserHistory.goBack}>Back</button>
        </div>
    )
}

export default BackButton;
