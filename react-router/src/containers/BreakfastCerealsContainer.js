import React, { Component } from 'react';
import CerealTile from '../components/CerealTile';

class BreakfastCerealsContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      cereals: []
    }
  }

  componentDidMount(){
    fetch('/api/v1/cereals')
    .then(response => {
      let parsed = response.json()
      return parsed
    }).then(cereals => {
      this.setState({ cereals: cereals})
    })
  }

  render(){
    let cereals = this.state.cereals.map(cereal => {
      return(
        <CerealTile
          key={cereal.id}
          id={cereal.id}
          name={cereal.name}
        />
      )
    })

    return(
      <div>
        <h3 className="so-great">Cereals Are Great</h3>
        {cereals}
      </div>
    )
  }
}

export default BreakfastCerealsContainer;
