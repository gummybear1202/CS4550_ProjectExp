
import React from 'react';
import {Button, PageHeader} from 'react-bootstrap';
import './react-big-calendar.css'; 
import BigCalendar from 'react-big-calendar';
import moment from 'moment';
import event from './event'

import './react-big-calendar.css'


BigCalendar.momentLocalizer(moment);

class MonthlyCalendar extends React.PureComponent{

	render() {
		console.log("Render")
      return (
      	<div>
      	  <PageHeader> View your schedule by month </PageHeader>
          <BigCalendar
          events={[]}
          startAccessor='startDate'
          endAccessor='endDate'
        />
      </div>
      );
   }
}

export default MonthlyCalendar;