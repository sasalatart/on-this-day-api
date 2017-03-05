import React, { PropTypes } from 'react';

const SubmitButton = ({ text, classType="primary", icon, onClick }) => {
  let buttonClassName = "button is-" + classType;

  return(
    <button
      type="submit"
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

SubmitButton.propTypes = {
  text: PropTypes.string.isRequired,
  classType: PropTypes.string,
  icon: PropTypes.string,
  onClick: PropTypes.func.isRequired
}

export default SubmitButton;
