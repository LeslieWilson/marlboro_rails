import React from 'react';



const ButtonList = props => {

    let mphDescription =  "went to dartmouth for public health, but not too much comp sci!! womp womp";
    let compsciDescription = "went back for another bachelors in computer science! having so much fun";
    let historyDescription =  "did history for my first bachelors and learned how to write! #noregrets";
    return (
        <div>

            <i className="fa fa-5x fa-fw  fa-book" onClick={() => alert(historyDescription)}/> -Marlboro round1

            <i className="fa fa-5x fa-fw fa-laptop" onClick={() =>  alert(compsciDescription)} /> - Marlboro round2

                < i className= "fa fa-5x fa-fw fa-user-md" onClick={() => alert(mphDescription)}/> -
            fartmouth medical school






        </div>


    )
}


export default ButtonList;
