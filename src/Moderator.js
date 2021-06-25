import React from 'react';
import {Button, TextBox} from './Common.js'

class Moderator extends React.Component {
	constructor(props) {
    super(props);
    this.state = {
    	passwordCorrect: false,
    	attemptedPassword: false
    };
  }
	handlePassword = (value) => {
		if (value === this.props.pw) {
			this.setState({passwordCorrect: true});
		}
		this.setState({attemptedPassword: true});
	}
	handleBackButton = (id) => {
		this.props.onBackButton();
	}
	render() {
		if (this.state.passwordCorrect) {
			return (
				<div>
					<p>Moderator stuff goes here.</p>
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
