import firebase from './firebase.js';

const Story = require('inkjs').Story;
const json = require('./script.ink.json');

class Script {
	initPerformance(props) {
		this.story = new Story(json);
		if (!props) {
			this.activeSpeaker = null;
			this.continue();
		} else {
			this.story.state.LoadJson(props.saveState);
			this.activeSpeaker = props.currentSpeaker;
		}
	}
	continue(canToggle = true) {
		let line = "";
		let choices = null;
		if (this.story.canContinue) {
			line = this.story.Continue();
		}
		if (canToggle) {
			if (this.story.currentTags.indexOf("Toggle") !== -1) {
				this.toggleActiveSpeaker();
			}
		}
		if (line === "") {
			let numChoices = this.story.currentChoices.length;
			if (numChoices > 0) {
				choices = {};
				for (let i = 0; i < numChoices; i++) {
					choices[i] = { text: null, votes: 0 };
					let newText = this.story.currentChoices[i].text.replace('/', '');
					choices[i].text = newText;
				}
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
	pickChoice(choice) {
		this.story.ChooseChoiceIndex(choice);
		this.continue(false);
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