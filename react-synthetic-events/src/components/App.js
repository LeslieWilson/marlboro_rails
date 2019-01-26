import React from 'react';
import NameForm from './NameForm';
import KarmaButton from './KarmaButton';

const App = (props) => {

let karmaAlert = (event) => {
alert("you've leveled up! (Karma: 1)");
}

let formChanger = (event) => {
    event.preventDefault();
    console.log("form submitted!");
}

  return (
    <div className="main-div">
      <NameForm formChangerProp={formChanger}/>
      <KarmaButton karmaAlertProp={karmaAlert} />
    </div>
  );
}

export default App;
