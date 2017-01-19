import React from 'react';

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

export default Button;
