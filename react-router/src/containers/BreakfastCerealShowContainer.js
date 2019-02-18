import React, { Component } from 'react';
import CerealInformation from '../components/CerealInformation';

class BreakfastCerealShowContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      cerealInfo: {}
    }
  }

  componentDidMount(){
    let cerealId = this.props.params.id
    fetch(`/api/v1/cereals/${cerealId}`)
    .then(response => {
      let parsed = response.json()
      return parsed
    }).then(cereal => {
      this.setState({ cerealInfo: cereal})
    })
  }

  render(){
    return(
      <CerealInformation
        id={this.state.cerealInfo.id}
        name={this.state.cerealInfo.name}
        description={this.state.cerealInfo.description}
        sugarContent={this.state.cerealInfo.sugar_content}
        deliciousness={this.state.cerealInfo.deliciousness}
      />
    )
  }
}

export default BreakfastCerealShowContainer;
