import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import Navbar from './components/Navbar';
import BreakfastCerealsContainer from './containers/BreafastCerealsContainer';
import BreakfastCerealShowContainer from './containers/BreakfastCerealShowContainer';


const App = props => {
    return(
        <Router history={browserHistory}>
        <Route path='/' component={NavBar} >
        <IndexRoute component={BreakfastCerealsContainer} />
        <Route path="cereals/:id" component={BreakfastCerealShowContainer}/>
        </Route>
        </Router>
    )
}


export default App;
