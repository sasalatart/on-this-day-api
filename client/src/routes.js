import React from 'react';
import { Route, IndexRoute } from 'react-router';
import App from './components/App';
import LandingPage from './components/LandingPage';
import EpisodesPage from './components/EpisodesPage';

export default(
  <Route path="/" component={App}>
    <IndexRoute component={LandingPage} />
    <Route path="/events" component={EpisodesPage} />
    <Route path="/births" component={EpisodesPage} />
    <Route path="/deaths" component={EpisodesPage} />
  </Route>
);
