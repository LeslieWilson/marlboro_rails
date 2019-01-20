import './main.scss'
import React from 'react';
import ReactDom from 'react-dom';

let headerElement = (
    <h1 onClick = { (event)  => {alert('Roar!')}>
    Im a react element hear me roar
    </h1>
);

ReactDOM.render(
    headerElement,
    document.getElementById('app')

);
