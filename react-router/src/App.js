import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import NavBar from './components/NavBar';
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
