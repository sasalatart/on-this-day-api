import React from 'react';
import ReactDOM from 'react-dom';
import { Router, browserHistory } from 'react-router';
import routes from './routes';
import '../node_modules/font-awesome/css/font-awesome.min.css';
import '../node_modules/bulma/css/bulma.css';
import '../node_modules/react-select/dist/react-select.min.css';
import './styles/index.css';

ReactDOM.render(
  <Router history={browserHistory} routes={routes} />,
  document.getElementById('root')
);
