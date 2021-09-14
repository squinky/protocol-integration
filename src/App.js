import React from 'react';
import firebase from './firebase.js';
import './App.css';
import Audience from './Audience.js';
import VideoCaller from './VideoCaller.js';
import Moderator from './Moderator.js';
import Welcome from './Welcome.js';

class App extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			role: null,
			performance: "loading"
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
	componentDidMount() {
		const performanceRef = firebase.database().ref('performance');
    performanceRef.on('value', (snapshot) => {
      const newState = snapshot.val();
      this.setState(state => ({
				performance: newState
			}));
			if (!newState) {
				this.handleBackButton();
			} else if (newState === "restarting") {
				if (this.state.role !== "moderator") {
					this.handleBackButton();
				}
			}
    });
	}
	componentWillUnmount() {
		this.setState = (state, callback) => {return;};
	}
	render() {
		let display;
		switch(this.state.role) {
			case "audiencea":
				display = ( <Audience performance={this.state.performance} speaker='a' /> );
				break;
			case "audienceb":
				display = ( <Audience performance={this.state.performance} speaker='b' /> );
				break;
			case "callera":
				display = ( <VideoCaller performance={this.state.performance} speaker='a' /> );
				break;
			case "callerb":
				display = ( <VideoCaller performance={this.state.performance} speaker='b' /> );
				break;
			case "moderator":
				display = ( <Moderator performance={this.state.performance} onBackButton={this.handleBackButton} /> );
				break;
			default:
				display = ( <Welcome performance={this.state.performance} onRoleSelected={this.handleRoleSelected} /> );
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
