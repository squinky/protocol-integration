// rename this file to firebase.js and fill in the correct values

import firebase from 'firebase'
const config = {
    apiKey: "PASTE_YOUR_API_KEY_HERE",
    authDomain: "protocol-integration.firebaseapp.com",
    databaseURL: "https://protocol-integration-default-rtdb.firebaseio.com",
    projectId: "protocol-integration",
    storageBucket: "protocol-integration.appspot.com",
    messagingSenderId: "897368366871"
};
firebase.initializeApp(config);
export default firebase;
