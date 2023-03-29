importScripts("https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.1/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyB48e286_xyb3imd4HioBfzLjznIh_n3Io",
  authDomain: "post-212c8.firebaseapp.com",
  projectId: "post-212c8",
  storageBucket: "gs://post-212c8.appspot.com",
  messagingSenderId: "992209537475",
  appId: "1:992209537475:web:9e9ce94d54c1f0261a9576",
  measurementId: "G-62MW0Q8QY0"
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});