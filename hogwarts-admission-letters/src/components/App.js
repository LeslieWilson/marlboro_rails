import React, {Component} from 'react';
import AcceptanceLetterText from './AcceptanceLetterText';
import RejectionLetterText from './RejectionLetterText';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        approval:'approved'
    }

    this.handleCheckboxChange = this.handleCheckboxChange.bind(this);
  };

  handleCheckboxChange(event) {
      event.preventDefault();
      if (this.state.approval=='approved'){
              this.setstate({
                  approval:'unapproved'
              })
          }
      }


  render() {
let isDocumentApproved;
if(this.state.approval=='approved'){
    isDocumentApproved= <AcceptanceLetterText />}
    else {
        isDocumentApproved= <RejectionLetterText />
    }
}
    return (
        <div>
        <div className="letter-body">
          <div className="small-12 small-centered text-center columns">
            <input onClick={this.handleCheckboxChange} type="checkbox" />
            <label>
              <h5>Rejected?</h5>
            </label>
          </div>
          </div>


          <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Hogwarts_coat_of_arms_colored_with_shading.svg/2000px-Hogwarts_coat_of_arms_colored_with_shading.svg.png" id="hogwarts-logo"/>
          <h1>HOGWARTS SCHOOL OF WITCHCRAFT AND WIZARDRY</h1>
          <br />
          <h3 id="headmaster-name">Headmaster: Albus Dumbledore</h3>
          <p id="merlin-order">
            (Order of Merlin, First Class, Grand Sorc., Chf. Warlock, Supreme Mugwump, International Confed. of Wizards)
          </p>
          <br />
          <p>Dear Addressee,</p>
          <div>
            {isDocumentApproved}
          </div>
          <br />
          <p>Yours sincerely,</p>
          <h3>Minerva McGonagall</h3>
          <h3>Deputy Headmistress</h3>

      </div>

    );
  };


export default App;
