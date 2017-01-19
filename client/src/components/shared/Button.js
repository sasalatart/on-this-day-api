import React from 'react';

const Button = ({ text, classType="primary", isLoading=false, icon, onClick }) => {
  let buttonClassName = "button is-" + classType;
  buttonClassName += isLoading ? " is-loading" : '';

  return(
    <button
      className={buttonClassName}
      disabled={isLoading}
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
