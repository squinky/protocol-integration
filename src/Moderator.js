import React from 'react';
import firebase from './firebase.js';
import script from './Script.js';
import {Button, TextBox} from './Common.js';

class Moderator extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			password: null,
			passwordCorrect: false,
			attemptedPassword: false,
			areYouSure: false
		};
	}
	handleContinueButton = (id) => {
		script.continue(this.props.performance);
	}
	handlePickButton = (id) => {
		let pickMe = 0;
		const choices = Object.values(this.props.performance.choices);
		choices.forEach((item, index) => {
			if (item.votes > this.props.performance.choices[pickMe].votes) {
				pickMe = index;
			}
		});
		script.pickChoice(pickMe);
	}
	handleEndButton = (id) => {
		if (this.state.areYouSure) {
			firebase.database().ref('performance').set(null);
			this.props.onBackButton();
		} else {
			this.setState({areYouSure: true});
		}
	}
	handleRestartButton = (id) => {
		firebase.database().ref('performance').set("restarting");
		script.initPerformance();
	}
	handlePassword = (value) => {
		if (value === this.state.password) {
			this.setState({passwordCorrect: true});
			script.initPerformance(this.props.performance);
		}
		this.setState({attemptedPassword: true});
	}
	handleBackButton = (id) => {
		if (this.state.areYouSure) {
			this.setState({areYouSure: false});
		} else {
			this.props.onBackButton();
		}
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
	componentWillUnmount() {
		this.setState = (state, callback) => {return;};
	}
	render() {
		if (this.state.areYouSure) {
			return (
				<div>
					<p>This will end the entire performance! Are you sure you want to do that?</p>
					<Button text="Yes, the show's over!" id="end" onClicked={this.handleEndButton} />
					<Button text="Whoops! Go back!" id="back" onClicked={this.handleBackButton} />
				</div>
			);
		} else if (this.state.passwordCorrect) {
			let currentLine, currentChoices, continueButton;
			if (this.props.performance.currentLine !== "") {
				if (this.props.performance.currentSpeaker) {
					currentLine = (
						<div className={this.props.performance.currentSpeaker}>
							<p>Video Caller {this.props.performance.currentSpeaker.toUpperCase()}:</p>
							<p>{this.props.performance.currentLine}</p>
						</div>
					);
				}
				continueButton = (
					<Button text="Continue" id="continue" onClicked={this.handleContinueButton} />
				);
			}
			if (this.props.performance.choices) {
				const choices = this.props.performance.choices;
				const choiceList = Object.keys(choices).map((i) =>
					<li key={i} className={choices[i].speaker}>{choices[i].text+" ("+choices[i].votes+" votes)"}</li>
				);
				currentChoices = (
					<ol>{choiceList}</ol>
				);
				if (!continueButton) {
					continueButton = (
						<Button text="Pick Choice" id="pick" onClicked={this.handlePickButton} />
					);
				}
			}
			return (
				<div>
					{currentLine}
					{currentChoices}
					{continueButton}
					<Button text="Start Over" id="end" onClicked={this.handleRestartButton} />
					<p>Once the show's over, click this button:</p>
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
