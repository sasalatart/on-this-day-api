import React from 'react';
import Select from 'react-select';
import Button from './shared/Button';
import { possibleDaysForMonth, possibleMonthsForDay } from '../utils/monthsOfTheYear';

class Landing extends React.Component {
  constructor(props, context) {
    super(props, context);

    this.episodeTypes = [
      { label: 'Events', value: 'events' },
      { label: 'Births', value: 'births' },
      { label: 'Deaths', value: 'deaths' },
    ];

    const possibleMonths = possibleMonthsForDay(1);
    const possibleDays = possibleDaysForMonth(1);
    this.state = {
      possibleMonths: possibleMonths,
      possibleDays: possibleDays,
      month: possibleMonths[0],
      day: possibleDays[0],
      episodeType: this.episodeTypes[0],
      loading: false
    }

    this.onDayChange = this.onDayChange.bind(this);
    this.onMonthChange = this.onMonthChange.bind(this);
    this.onEpisodeTypeChange = this.onEpisodeTypeChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
  }

  onDayChange(value) {
    const day = value || possibleDaysForMonth(1)[0];

    this.setState({ day: day, possibleMonths: possibleMonthsForDay(day.value) });
  }

  onMonthChange(value) {
    const month = value || possibleMonthsForDay(1)[0];

    this.setState({ month: month, possibleDays: possibleDaysForMonth(month.value) });
  }

  onEpisodeTypeChange(value) {
    this.setState({ episodeType: value || this.episodeTypes[0] })
  }

  onSubmit() {
    this.setState({ loading: true })
    console.log(this.state.month, this.state.day, this.state.episodeType);
  }

  render() {
    return (
      <div className="full-height aligner flex-column">
        <h1 className="title is-1">Search For Historical Episodes</h1>

        <h2 className="title">
          Data Taken From <a href="http://www.wikipedia.org" target="_blank">Wikipedia</a>
        </h2>

        <div className="full-width columns">
          <div className="column is-2 is-offset-3">
            <Select
              name="month"
              value={this.state.month.value}
              options={this.state.possibleMonths}
              onChange={this.onMonthChange} />
          </div>
          <div className="column is-1">
            <Select
              name="day"
              value={this.state.day.value}
              options={this.state.possibleDays}
              onChange={this.onDayChange} />
          </div>
          <div className="column is-2">
            <Select
              name="episodeType"
              value={this.state.episodeType.value}
              options={this.episodeTypes}
              onChange={this.onEpisodeTypeChange} />
          </div>
          <div className="column is-1 aligner">
            <Button
              text="search"
              icon="search"
              isLoading={this.state.loading}
              onClick={this.onSubmit} />
          </div>
        </div>
      </div>
    );
  }
}

export default Landing;
