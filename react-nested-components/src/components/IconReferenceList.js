import React from 'react';
import Icon from './Icon';

const IconReferenceList = props => {
  let articleDescription=`These are written lessons that will walk you through
    a particular concept or technique. Don't submit anything for these!`;
  let exerciseDescription=`These assignments are intended to be small, short tasks
   that will allow you to put some of that newly acquired knowledge to work!
   You should submit solutions to all of these via ET!`;
  let challengeDescription=`These assignments are larger, and usually require you to
   put two or three of the new concepts you've learned together.
   You should submit solutions to all of these via ET!`;


   let listOfIcons = [
    <Icon
      key="1"
      iconName="Article"
      fontAwesomeSymbol='fa-file-text-o'
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
