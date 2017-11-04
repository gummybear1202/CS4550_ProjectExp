import React from 'react';
import {Navbar, Nav, NavItem, PageHeader} from 'react-bootstrap';
import Tasks from './Tasks'

class App extends React.Component {


   render() {
      return (
         <div>
            <Navbar>
            	<Navbar.Header>
            		<Navbar.Brand>	
            			<a href="#"> Manager App </a>
            		</Navbar.Brand>
            	</Navbar.Header>
	            <Nav pullRight>
	            	<NavItem eventKey={1} href='#'> View Profile </NavItem>
	            </Nav>
            </Navbar>



            <Tasks />

         </div>
      );
   }
}

export default App;