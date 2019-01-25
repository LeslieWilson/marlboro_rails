import React from 'react';
import Lisp from './Lisp';


const App = props => {

    let data = [
        { id: 1, name: 'test1'},
        { id: 2, name: 'test2'},
        { id: 3, name: 'test3'}
    ];


  return(
    <div>
      <h1>Lisp</h1>


<Lisp
items={data}
handleButtonClick= {(event) => {alert('selected')} }
/>
</div>
)
};

export default App;
