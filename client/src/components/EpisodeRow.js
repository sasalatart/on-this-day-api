import React, { PropTypes } from 'react';

const EpisodeRow = ({ bce, year, text }) => {
  if (bce) { year += 'BCE'; }

  return(
    <tr>
      <td>{ year }</td>
      <td>{ text }</td>
    </tr>
  );
}

EpisodeRow.propTypes = {
  bce: PropTypes.bool.isRequired,
  year: PropTypes.number.isRequired,
  text: PropTypes.string.isRequired
}

export default EpisodeRow;
