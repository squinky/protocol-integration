import React from 'react';

class VideoCaller extends React.Component {
	render() {
		if (!this.props.performance) return null;
		const p = this.props.performance;
		if (p.currentSpeaker === this.props.speaker && p.currentLine !== "" && !p.currentLine.includes('@')) {
			let display;
			if (p.currentLine.includes('/')) {
				let newText = p.currentLine.replace('/', '');
				display = ( <p>{newText.trim()}</p> );
			} else {
				display = ( <p>{"Say: "+p.currentLine.trim()}</p> );
			}
			return (
				<div className={"bubble "+this.props.speaker}>
					{display}
				</div>
			);
		} else {
			return (
				<div>
					<p>You don't have to do anything right now - you will be given instructions shortly.</p>
				</div>
			);
		}
	}
}

export default VideoCaller;
