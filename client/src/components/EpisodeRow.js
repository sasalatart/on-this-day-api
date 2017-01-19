import React from 'react';

const EpisodeRow = ({ bce, year, text }) => {
  if (bce) { year += 'BCE'; }

  return(
    <tr>
      <td>{ year }</td>
      <td>{ text }</td>
    </tr>
  );
}

export default EpisodeRow;
