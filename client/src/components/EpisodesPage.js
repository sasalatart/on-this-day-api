import React from 'react';
import EpisodesTable from './EpisodesTable';
import RingLoader from './shared/RingLoader';
import { months } from '../utils/monthsOfTheYear';
import * as axios from 'axios';
import * as iziToast from '../../node_modules/izitoast/dist/js/iziToast.min.js';

class EpisodesPage extends React.Component {
  constructor(props, context) {
    super(props, context);

    this.title = this.props.location.pathname.substring(1);
    this.subtitle = months.find(monthInfo => {
      return monthInfo.value + "" === this.props.location.query.month;
    }).label + " " + this.props.location.query.day;

    this.state = { loading: true };
  }

  componentWillMount() {
    const url = this.props.location.pathname + this.props.location.search;
    axios.get(url).then(response => {
      this.setState({
        day: response.data.day,
        month: response.data.month,
        description: response.data.description,
        episodes: response.data.events || response.data.births || response.data.deaths,
        loading: false
      });
    }).catch(error => {
      iziToast.error({ title: 'Error retrieving data.' });
    });
  }

  render() {
    return(
      <div className="episodes-page container">
        <h1 className="title is-1 has-text-centered">{ this.title }</h1>
        <h2 className="title has-text-centered">{ this.subtitle }</h2>
        { this.state.loading ?
          <div className="aligner">
            <RingLoader color="#ffffff" size="256px" />
          </div> :
          <EpisodesTable episodes={this.state.episodes} />
        }
      </div>
    );
  }
}

export default EpisodesPage;
