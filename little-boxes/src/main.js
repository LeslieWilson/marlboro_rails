import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';

import style from './styles/app.scss'

import Wrapper from './components/Wrapper';
import Picture from './components/Picture';
import List from './components/List';
import Numbers from './components/Numbers';

ReactDOM.render(
  <div>
    <Wrapper />
    <Picture />
    <List />
    <Numbers />
  </div>,
  document.getElementById('app')
);
