import React from 'react';
import {PageHeader, Grid, Row, Col, Thumbnail, Button} from 'react-bootstrap';


class Tasks extends React.Component {
	contructor(props){
		super(props);

		this.state = {
			completedShift = false,

		};

		this.onClick = this.onClick.bind(this);
	}

	onClick() {
		this.setState({
			completedShift = true,
		});
	}
	render() {
      return (
      	<div>
            <PageHeader> Your assigned tasks</PageHeader>

            <Grid>
			    <Row>
			      <Col xs={6} md={4}>
			        <Thumbnail>
			          <h3>Task 1</h3>
			          <h4> Due date: 12/12/2017</h4>
			          <p>Description: Submit report for perishable inventory status.</p>
			          <p>
			            <Button bsStyle="primary">Completed!</Button>&nbsp;
			            <Button bsStyle="default">Contact Manager</Button>
			          </p>
			        </Thumbnail>
			      </Col>
			      <Col xs={6} md={4}>
			        <Thumbnail>
			          <h3>Task 2</h3>
			          <h4> Due date: 12/31/2017</h4>
			          <p>Description: Complete annual end-of-year employee survey.</p>
			          <p>
			            <Button bsStyle="primary">Completed</Button>&nbsp;
			            <Button bsStyle="default">Contact Manager</Button>
			          </p>
			        </Thumbnail>
			      </Col>
			      <Col xs={6} md={4}>
			        <Thumbnail>
			          <h3>Task 3</h3>
			          <h4> Due date: 1/5/2017</h4>
			          <p>Description: Restock the beverage machine.</p>
			          <p>
			            <Button bsStyle="primary">Completed</Button>&nbsp;
			            <Button bsStyle="default">Contact Manager</Button>
			          </p>
			        </Thumbnail>
			      </Col>
			    </Row>
			</Grid>
		</div>
      );
   }
}

export default Tasks;