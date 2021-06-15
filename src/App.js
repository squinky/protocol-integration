import React from 'react';
import './App.css';

class Protocol extends React.Component {
	constructor(props) {
		super(props);
		this.state = {upvoted: false};
		this.handleUpvote = this.handleUpvote.bind(this);
	}
	handleUpvote() {
		this.setState(prevState => ({
			upvoted: !prevState.upvoted
		}));
	}
	render() {
		return (
			<div className="Protocol">
				<p className="Protocol-text">{this.props.text}</p>
				<div className="Protocol-buttons">
					<button onClick={this.handleUpvote}>{this.state.upvoted ? '👎' : '👍'}</button>
					<button>❌</button>
				</div>
			</div>
		);
	}
}

function ProtocolList(props) {
	const protocols = props.protocols;
	const listItems = protocols.map((protocol) =>
		<Protocol key={protocol.text} text={protocol.text} />
	);
	return (
		<div className="ProtocolList">
			{listItems}
		</div>
	);
}

const protocols = [
	{text: "Here is a protocol", upvotes: 0},
	{text: "Here is another protocol", upvotes: 0},
	{text: "Here is yet another protocol", upvotes: 0},
	{text: "Here is a potato", upvotes: 0}
]

function App() {
	return (
		<div className="App">
			<header className="App-container">
				<ProtocolList protocols={protocols} />
			</header>
		</div>
	);
}

export default App;
