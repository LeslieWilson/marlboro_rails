import React from 'react';

const Icon = props => {
    let iconClass = "fa fa-2x fa-fw " + props.fontAwesomeSymbol;
    let iconName = props.iconName;
    let descriptionAlert = () => alert(props.description);

    return (
        <li onClick  ={descriptionAlert}  >
        <i className ={iconClass} /> - {iconName}
        </li>

    );
};

export default Icon;


<i class="fas fa-user-md"></i>
