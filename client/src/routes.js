import React from 'react';
import { Route, IndexRoute, browserHistory } from 'react-router';
import App from './components/App';
import LandingPage from './components/LandingPage';

export default(
  <Route path="/" browserHistory={browserHistory} component={App}>
    <IndexRoute component={LandingPage} />
  </Route>
);
