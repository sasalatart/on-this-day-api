import React from 'react';
import EpisodeRow from './EpisodeRow';

const EpisodesTable = ({ episodes }) => {
  return(
    <table className="rwd-table">
      <thead>
        <tr>
          <th>Year</th>
          <th>Episode</th>
        </tr>
      </thead>
      <tbody>
        { episodes.map(episode => <EpisodeRow key={episode.id} {...episode} />) }
      </tbody>
  </table>
  );
}

export default EpisodesTable;
