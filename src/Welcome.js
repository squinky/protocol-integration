import React from 'react';
import {Button} from './Common.js'

class Welcome extends React.Component {
	handleButton = (id) => {
		this.props.onRoleSelected(id);
	}
	render() {
		if (!this.props.performance) {
			return (
				<div>
					<p>Welcome to Protocol Integration.</p>
					<Button text="Start Performance" id="moderator" onClicked={this.handleButton} />
				</div>
			);
		} else {
			return (
				<div>
					<p>Welcome to Protocol Integration. Please select your role:</p>
					<Button text="Audience" id="audience" onClicked={this.handleButton} />
					<Button text="Video Caller" id="caller" onClicked={this.handleButton} />
					<Button text="Moderator" id="moderator" onClicked={this.handleButton} />
				</div>
			);
		}
	}
}

export default Welcome;
