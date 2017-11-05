import React from 'react';
import {Navbar, Nav, NavItem, PageHeader, Tabs, Tab} from 'react-bootstrap';
import Tasks from './Tasks'
// Attribution: Referred to react-bootstrap documentation

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

			<Tabs defaultActiveKey={1} animation={false} id="noanim-tab-example">
				<Tab eventKey={1} title="Assigned Tasks"> <Tasks /></Tab>
			    <Tab eventKey={2} title="Upcoming Week">Tab 2 content</Tab>
			    <Tab eventKey={3} title="Calendar" disabled>Tab 3 content</Tab>
			</Tabs>

         </div>
      );
   }
}

export default App;