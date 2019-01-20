import React from 'react';

const App = props => {
  return(
    <div>
      <h1>Grocery List</h1>

      <ul>
        <li>
          Oranges
          <button type="button" onClick={ (event) => { alert('Button was clicked')} }>Delete</button>
        </li>
        <li>
          Bananas
          <button type="button" onClick={ (event) => { alert('Button was clicked')} }>Delete</button>
        </li>
        <li>
          Bread
          <button type="button" onClick={ (event) => { alert('Button was clicked')} }>Delete</button>
        </li>
      </ul>
    </div>
  );
};

export default App;
