import firebase from './firebase.js';

const Story = require('inkjs').Story;
const json = require('./script.ink.json');

class Script {
	constructor() {
		this.story = new Story(json);
		this.activeSpeaker = null;
	}
	initPerformance(props) {
		if (!props) {
			this.continue();
		} else {
			this.story.state.LoadJson(props.saveState);
			this.activeSpeaker = props.currentSpeaker;
		}
	}
	continue() {
		const line = this.story.Continue();
		if (this.story.currentTags.indexOf("Toggle") !== -1) {
			this.toggleActiveSpeaker();
		}
		let choices = null;
		let numChoices = this.story.currentChoices.length;
		if (numChoices > 0) {
			choices = {};
			for (let i = 0; i < numChoices; i++) {
				choices[i] = { text: null, votes: 0 };
				choices[i].text = this.story.currentChoices[i].text;
			}
		}
		const state = this.story.state.toJson();
		firebase.database().ref('performance').set({
			currentLine: line,
			currentSpeaker: this.activeSpeaker,
			choices: choices,
			saveState: state
		});
	}
	toggleActiveSpeaker() {
		if (this.activeSpeaker === "a") {
			this.activeSpeaker = "b";
		} else {
			this.activeSpeaker = "a";
		}
	}
}

const instance = new Script();
export default instance;