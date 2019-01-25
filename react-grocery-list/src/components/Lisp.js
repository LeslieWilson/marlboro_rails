import React from 'react';
import Item from './Item';

const Lisp = props => {
let listOfItems =[
    {
    key: "1",
    itemName:"test1",
    description: "test1 Description"
    },
    {
    key:"2",
    itemName:"test2",
    description:"test2 Description"
    },
    {
    key:"3",
    itemName:"test3",
    description:"test3 Description"
    }
]
let items =listOfItems.map(item => {
    return(
    <Item
    key = {item.key}
    itemName={item.itemName}
    description={item.description}
    />
)
})

return(
    <div>
    <ul>
    {items}
    </ul>
    </div>
)};




export default Lisp;
