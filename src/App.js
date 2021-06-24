import React from 'react';
import './App.css';

class Button extends React.Component {
	handleClick = () => {
		this.props.onClicked(this.props.text);
	}
	render() {
		return (
			<button onClick={this.handleClick}>{this.props.text}</button>
		);
	}
}

class Welcome extends React.Component {
	handleButtonClicked = (text) => {
		this.props.onRoleSelected(text);
	}
	render() {
		return (
			<div className="Welcome">
				<p>Welcome to Protocol Integration. Please select your role:</p>
				<Button text="Audience" onClicked={this.handleButtonClicked} />
				<Button text="Video Caller" onClicked={this.handleButtonClicked} />
				<Button text="Moderator" onClicked={this.handleButtonClicked} />
			</div>
		);
	}
}

class App extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			role: null
		}
	}
	handleRoleSelected = (r) => {
		this.setState(state => ({
			role: r
		}));
	}
	render() {
		let display;
		switch(this.state.role) {
			case "Audience":
				display = ( <div>Audience stuff goes here.</div> );
				break;
			case "Video Caller":
				display = ( <div>Video caller stuff goes here.</div> );
				break;
			case "Moderator":
				display = ( <div>Moderator stuff goes here.</div> );
				break;
			default:
				display = ( <Welcome onRoleSelected={this.handleRoleSelected} /> );
		}
		return (
			<div className="App">
				<header className="App-container">
					{display}
				</header>
			</div>
		);
	}
}

export default App;
