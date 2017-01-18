import React from 'react';
import Header from './shared/Header';
import Footer from './shared/Footer';

class App extends React.Component {
  render() {
    return(
      <div className="main-app">
        <Header />
        <div className="main-body">
          { this.props.children }
        </div>
        <Footer />
      </div>
    );
  }
}

export default App;
