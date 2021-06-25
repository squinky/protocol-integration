import React from 'react';
import firebase from './firebase.js'
import {Button, TextBox} from './Common.js'

class Moderator extends React.Component {
	constructor(props) {
    super(props);
    this.state = {
    	password: null,
    	passwordCorrect: false,
    	attemptedPassword: false
    };
  }
	handleEndButton = (id) => {
		firebase.database().ref('performance').set(null);
		this.props.onBackButton();
	}
	handlePassword = (value) => {
		if (value === this.state.password) {
			this.setState({passwordCorrect: true});
			if (!this.props.performance) {
				firebase.database().ref('performance').set(
					{
						choices: {
							testchoice1: { text: "Test Choice 1", goto: "next1", votes: 0 },
							testchoice2: { text: "Test Choice 2", goto: "next2", votes: 0 },
							testchoice3: { text: "Test Choice 3", goto: "next3", votes: 0 }
						}
					}
				);
			}
		}
		this.setState({attemptedPassword: true});
	}
	handleBackButton = (id) => {
		this.props.onBackButton();
	}
	componentDidMount() {
		const pwRef = firebase.database().ref('password');
    pwRef.on('value', (snapshot) => {
      const newState = snapshot.val();
      this.setState(state => ({
				password: newState
			}));
    });
	}
	render() {
		if (this.state.passwordCorrect) {
			return (
				<div>
					<p>Moderator stuff goes here.</p>
					<Button text="End Performance" id="end" onClicked={this.handleEndButton} />
				</div>
			);
		} else {
			let passwordText = <p>You'll need a password for that:</p>;
			if (this.state.attemptedPassword) {
				passwordText = <p>Nope, that wasn't the password. Try again:</p>;
			}
			return (
				<div>
					{passwordText}
					<TextBox onSubmitted={this.handlePassword} />
					<Button text="Whoops! Go back!" id="back" onClicked={this.handleBackButton} />
				</div>
			);
		}
	}
}

export default Moderator;
