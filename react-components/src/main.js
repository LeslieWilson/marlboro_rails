import React from 'react';
import ReactDOM from 'react-dom';
import MessageComponent from './components/MessageComponent';

ReactDOM.render(
  <MessageComponent message= 'hello from main.js'/>,
  document.getElementById('app')
);
