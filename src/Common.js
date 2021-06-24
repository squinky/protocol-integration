import React from 'react';

export class Button extends React.Component {
	handleClick = () => {
		this.props.onClicked(this.props.id);
	}
	render() {
		return (
			<button onClick={this.handleClick}>{this.props.text}</button>
		);
	}
}
