import  React from 'react';
import { Link } from 'react-router';
import BackButton from './BackButton';

const  Navnar = props => {
    return(
        <div>
        <div className="navbar">
        </Backbutton />
        <Link to ='/'>HOME</Link>
        </div>
        <div className="content">
        <h1 className="page-title">categories</h1>
        {props.children}
        </div>
        </div>
    )
}

export default NavBar;
