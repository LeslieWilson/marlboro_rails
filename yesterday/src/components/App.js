import React, { Component } from 'react';
import '../stylesheets/App.css';


class App extends Component {
    constructor(props) {
        super(props);
        this.state = {
            clicked: 'clicked'
        }
        this.handleClick =
        this.handleClick.bind(this)

        this.buttonAlert = this.buttonAlert.bind(this)


    }

    handleClick(event) {
        event.preventDefault();
        if(this.state.clicked === 'clicked'){
            this.setState({
                clicked:'unclicked'
            })
    }

    if(this.state.clicked === 'unclicked'){
        this.setState({
            clicked: 'clicked'
        })
    }
}

    buttonAlert(event) {
        event.preventDefault();
    alert("you clicked me! ");
}

  render() {
    return (

      <div className={this.state.clicked}>


      <p className='rylan'>stupid stupid rylan!!</p>

      <button className='btn' onClick = {this.handleClick}>CLICK HERE if you agree</button>
      <button className='alrtbtn' onClick = {this.buttonAlert}> what did i do  </button>

      </div>
    );
  }
}

export default App;
