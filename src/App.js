import React from 'react';
import './App.css';
import firebase from './firebase.js'
import Audience from './Audience.js'
import VideoCaller from './VideoCaller.js'
import Moderator from './Moderator.js'
import Welcome from './Welcome.js'

class App extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			role: null,
			pw: null
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
		const pwRef = firebase.database().ref('password');
    pwRef.on('value', (snapshot) => {
      const newState = snapshot.val();
      this.setState(state => ({
				pw: newState
			}));
    });
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
				display = ( <Moderator pw={this.state.pw} onBackButton={this.handleBackButton} /> );
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
