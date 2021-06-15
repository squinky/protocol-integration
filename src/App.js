import React from 'react';
import './App.css';

class Protocol extends React.Component {
	render() {
		return (
			<div className="Protocol">
				<p className="Protocol-text">{this.props.text}</p>
				<div className="Protocol-buttons">
					<button className="Protocol-upvote">👍</button>
					<button className="Protocol-veto">❌</button>
				</div>
			</div>
		);
	}
}

function ProtocolList(props) {
	const protocols = props.protocols;
	const listItems = protocols.map((protocol) =>
		<Protocol key={protocol} text={protocol} />
	);
	return (
		<div className="ProtocolList">
			{listItems}
		</div>
	);
}

const protocols = [
	"Here is a protocol",
	"Here is another protocol",
	"Here is yet another protocol"
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
