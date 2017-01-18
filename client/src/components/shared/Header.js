import React from 'react';
import { Link } from 'react-router';

const Header = () => {
  return(
    <header className="nav">
      <div className="container">
        <div className="nav-left">
          <Link to="/" className="nav-item">On This Day</Link>
        </div>
      </div>
    </header>
  );
}

export default Header;
