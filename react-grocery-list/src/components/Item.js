import React from 'react';

const Item = props => {
    let itemName= props.itemName;
    let descriptionAlert = () => alert(props.description);

    return(
        <li onCLick ={descriptionAlert} >
        {itemName}
        </li>

    );
};

export default Item;
