import React from 'react';
import './App.css';
import Audience from './Audience.js'
import VideoCaller from './VideoCaller.js'
import Moderator from './Moderator.js'
import Welcome from './Welcome.js'

class App extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			role: null
		}
	}
	handleRoleSelected = (r) => {
		this.setState(state => ({
			role: r
		}));
	}
	handleBackButton = () => {
		this.setState(state => ({
			role: null
		}));
	}
	render() {
		let display;
		switch(this.state.role) {
			case "audience":
				display = ( <Audience /> );
				break;
			case "caller":
				display = ( <VideoCaller /> );
				break;
			case "moderator":
				display = ( <Moderator onBackButton={this.handleBackButton} /> );
				break;
			default:
				display = ( <Welcome onRoleSelected={this.handleRoleSelected} /> );
		}
		return (
			<div className="App">
				<header className="App-container">
					{display}
				</header>
			</div>
		);
	}
}

export default App;
