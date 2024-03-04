importScripts("https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.1/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyDh5x64nAT5Ja88aVmAUDGcbs1cedog8Oo",
  authDomain: "post-app-d6f0c.firebaseapp.com",
  projectId: "post-app-d6f0c",
  storageBucket: "post-app-d6f0c.appspot.com",
  messagingSenderId: "487915190018",
  appId: "1:487915190018:web:969bc7a8bc79af90cdb41b",
  measurementId: "G-BBR78C18JX"
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});