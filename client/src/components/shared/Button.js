import React, { PropTypes } from 'react';

const Button = ({ text, classType="primary", icon, onClick }) => {
  let buttonClassName = "button is-" + classType;

  return(
    <button
      className={buttonClassName}
      onClick={onClick}>
      { icon &&
        <span className="icon">
          <i className={"fa fa-" + icon}></i>
        </span>
      }
      <span>{ text }</span>
    </button>
  );
}

Button.propTypes = {
  text: PropTypes.string.isRequired,
  classType: PropTypes.string,
  icon: PropTypes.string,
  onClick: PropTypes.func.isRequired
}

export default Button;
