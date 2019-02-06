import React, { Component } from 'react';


import '../stylesheets/App.css';

class App extends React.Component {
    constructor(props){
        super(props);
        this.state ={
            clicked:"clicked"
        };
        this.handleClick = this.handleClick.bind(this);
    }

handleClick(event) {
    event.preventDefault();
    if(this.state.clicked=='clicked'){
        this.setstate({
            clicked:'notclicked'
        })
    }
}



  render() {

    return (
      <div className={this.state.clicked}>


            nate is stupid stupid stipd!!!
<button
className='btn'

onClick={this.handleClick}>click here if you agree</button>

      </div>
    );
  }
};

export default App;
