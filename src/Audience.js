import React from 'react';
import firebase from './firebase.js'
import {Button} from './Common.js'

class Audience extends React.Component {
	constructor(props) {
    super(props);
    this.state = {
    	selected: null
    };
  }
	handleChoice = (id) => {
		const prev = this.state.selected
		const updates = {};
		if (prev) {
  		updates[`performance/choices/${prev}/votes`] = firebase.database.ServerValue.increment(-1);
		}
  	updates[`performance/choices/${id}/votes`] = firebase.database.ServerValue.increment(1);
		firebase.database().ref().update(updates);
		this.setState(state => ({
			selected: id
		}));
	}
	componentDidUpdate() {
		if (!this.props.performance) return;
		let resetChoices = true;
		const choices = this.props.performance.choices;
		if (choices) {
			const choiceValues = Object.values(choices);
			choiceValues.forEach((item) => {
				if (item.votes) resetChoices = false;
			});
		}
		if (resetChoices && this.state.selected) {
			this.setState(state => ({
				selected: null
			}));
		}
	}
	render() {
		if (!this.props.performance) return null;
		let choices = [];
		const allChoices = this.props.performance.choices;
		if (allChoices) {
			for (let i = 0; i < allChoices.length; i++) {
				if (allChoices[i].speaker === this.props.speaker) {
					choices.push(allChoices[i]);
				}
			}
		}
		if (choices.length > 0) {
			const choiceList = Object.keys(choices).map((i) =>
				<Button
					key={i}
					text={choices[i].text+" ("+choices[i].votes+" votes)"}
					speaker={choices[i].speaker}
					id={i}
					onClicked={this.handleChoice}
					selected={this.state.selected === i} />
			);
			return (
				<div>
					<p>Please vote for one of the following:</p>
					{choiceList}
				</div>
			);
		} else {
			if (this.props.performance.currentLine && this.props.performance.currentLine.includes('@')) {
				let newText = this.props.performance.currentLine.replace('@', '');
				return (
					<div className="bubble">
						<p>{newText.trim()}</p>
					</div>
				);
			} else {
				return (
					<div>
						<p>You don't have to do anything right now - just sit back and enjoy the show!</p>
					</div>
				);
			}
		}
	}
}

export default Audience;
