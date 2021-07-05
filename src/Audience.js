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
	render() {
		if (!this.props.performance) {
			return (
				<div>
					<p>That's the end of the show! Thanks for playing!</p>
				</div>
			);
		}
		const choices = this.props.performance.choices;
		if (!choices) {
			return (
				<div>
					<p>At certain points during the performance, you will be prompted to vote on what happens next. Until then, please sit back and enjoy the show.</p>
				</div>
			);
		} else {
			const choiceList = Object.keys(choices).map((i) =>
				<Button
					key={i}
					text={choices[i].text+" ("+choices[i].votes+" votes)"}
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
		}
	}
}

export default Audience;
