import  React  from 'react';

const Popup = props => {
    let handleExit  = () => {
        confirm("are you sure you wanna leave?")
    }
    return(
        <div onClick={handleExit}>
        ...
        </div>
    );
};

export default Popup;
