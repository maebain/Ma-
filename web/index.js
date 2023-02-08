//Import the functions you need from the SDKs you need

import { initializeApp } from "firebase/app";

import { getAnalytics } from "firebase/analytics";

// TODO: Add SDKs for Firebase products that you want to use

// https://firebase.google.com/docs/web/setup#available-libraries


// Your web app's Firebase configuration

// For Firebase JS SDK v7.20.0 and later, measurementId is optional

const firebaseConfig = {

  apiKey: "AIzaSyD_ab6pePB9zuXkkXZsa6ojb72mDznK1n8",

  authDomain: "trashtag-app--signin.firebaseapp.com",

  projectId: "trashtag-app--signin",

  storageBucket: "trashtag-app--signin.appspot.com",

  messagingSenderId: "726424196389",

  appId: "1:726424196389:web:3e0907e5cd2a94432536cc",

  measurementId: "G-YV83CZ4WHN"

};


// Initialize Firebase

const app = initializeApp(firebaseConfig);

const analytics = getAnalytics(app);