import React from 'react';
import {Button} from './Common.js'

class Welcome extends React.Component {
	handleButtonClicked = (id) => {
		this.props.onRoleSelected(id);
	}
	render() {
		return (
			<div className="Welcome">
				<p>Welcome to Protocol Integration. Please select your role:</p>
				<Button text="Audience" id="audience" onClicked={this.handleButtonClicked} />
				<Button text="Video Caller" id="caller" onClicked={this.handleButtonClicked} />
				<Button text="Moderator" id="moderator" onClicked={this.handleButtonClicked} />
			</div>
		);
	}
}

export default Welcome;
