import React from 'react';

const CerealInformation = props => {
  return(
    <div>
      <h2 className="cereal-name">{props.name}</h2>
      <p>{props.description}</p>
      <h3>Sugar Content: {props.sugarContent}</h3>
      <h3>Deliciousness: {props.deliciousness}</h3>
    </div>
  )
}

export default CerealInformation;
