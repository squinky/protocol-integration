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
		} else if (this.props.performance === "loading") {
			return (
				<div>
					<p>Loading...</p>
				</div>
			);
		} else {
			return (
				<div>
					<p>Welcome to Video Call Calamity. Please select your role:</p>
					<Button text="Video Caller A" id="callera" speaker="a" onClicked={this.handleButton} />
					<Button text="Video Caller B" id="callerb" speaker="b" onClicked={this.handleButton} />
					<Button text="Audience A" id="audiencea" speaker="a" onClicked={this.handleButton} />
					<Button text="Audience B" id="audienceb" speaker="b" onClicked={this.handleButton} />
					<Button text="Moderator" id="moderator" onClicked={this.handleButton} />
				</div>
			);
		}
	}
}

export default Welcome;
