import React from 'react';

const KarmaButton = (props) => {


  return (

    <div className="row">
      <div className="small-12 small-centered columns text-center" onClick= {props.karmaAlertProp}>
        <button className="button large expand">Add Karma++</button>
      </div>
    </div>
  );
}

export default KarmaButton;
