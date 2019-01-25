import React from 'react';
import Icon from './Icon';

const IconReferenceList = props => {
  let articleDescription='this is a newspaper';
  let exerciseDescription=`blah!`;
  let challengeDescription=`hello`;


   let listOfIcons = [
    <Icon
      key="1"
      iconName="Article"
      fontAwesomeSymbol='fas-fa-user-md'
      description={articleDescription}
    />,
    <Icon
      key="2"
      iconName="Exercise"
      fontAwesomeSymbol='fa-heartbeat'
      description={exerciseDescription}
    />,
    <Icon
      key="3"
      iconName="Challenge"
      fontAwesomeSymbol='fa-puzzle-piece'
      description={challengeDescription}
    />
  ]

     return(
       <div>
         <ul>
           {listOfIcons}
         </ul>
       </div>
     );
};

export default IconReferenceList;
