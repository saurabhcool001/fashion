import 'package:flutter/material.dart';

//Custom Package
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion/customClass/home.dart';
import 'dart:async';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
//  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  SharedPreferences _sharedPreferences;
  bool loading = false;
  bool isLogIn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSignIn();
  }

  //For User is Signed In/Not
  void isSignIn() async {
    setState(() {
      loading = true;
    });

    _sharedPreferences = await SharedPreferences.getInstance();
//    isLogIn = await _googleSignIn.isSignedIn();
    final FirebaseUser firebaseUser = await _firebaseAuth.currentUser();

    if (firebaseUser != null) {
      Fluttertoast.showToast(msg: "Welcome");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //For SignIn
  Future<FirebaseUser> _handleSignIn() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      final FirebaseUser user = await _auth.signInWithCredential(credential);

      if (user != null) {
        final QuerySnapshot result = await _firestore
            .collection("users")
            .where("id", isEqualTo: user.uid)
            .getDocuments();

        final List<DocumentSnapshot> documents = result.documents;
        if (documents.length == 0) {
          //insert the user to database
          _firestore.collection("users").document(user.uid).setData({
            "id": user.uid,
            "username": user.displayName,
            "profilePicture": user.photoUrl
          });

          await _sharedPreferences.setString("id", user.uid);
          await _sharedPreferences.setString("username", user.displayName);
          await _sharedPreferences.setString("photoUrl", user.displayName);
        } else {
          await _sharedPreferences.setString("id", documents[0]['id']);
          await _sharedPreferences.setString(
              "username", documents[0]['username']);
          await _sharedPreferences.setString(
              "photoUrl", documents[0]['photoUrl']);
        }

        Fluttertoast.showToast(msg: "Sign In Success");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        setState(() {
          loading = false;
        });
      }
    } catch (error) {
      setState(() {
        loading = false;
      });
      Fluttertoast.showToast(msg: "Sign In Failed");
    }
  }

//  Future<FirebaseUser> handleSignIn() async {
//    _sharedPreferences = await SharedPreferences.getInstance();
//
//    setState(() {
//      loading = true;
//    });
//
//    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
//    GoogleSignInAuthentication googleAuth =
//    await googleSignInAccount.authentication;
//
//    final AuthCredential credential = GoogleAuthProvider.getCredential(
//        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
//
//    final FirebaseUser user =
//    await _firebaseAuth.signInWithCredential(credential);
//
//    if (user != null) {
//      Fluttertoast.showToast(msg: "inside if");
//      final QuerySnapshot result = await _firestore
//          .collection("users")
//          .where("id", isEqualTo: user.uid)
//          .getDocuments();
//      final List<DocumentSnapshot> documents = result.documents;
//      if (documents.length == 0) {
//        //insert the user to database
//        _firestore.collection("users").document(user.uid).setData({
//          "id": user.uid,
//          "username": user.displayName,
//          "profilePicture": user.photoUrl
//        });
//
//        await _sharedPreferences.setString("id", user.uid);
//        await _sharedPreferences.setString("username", user.displayName);
//        await _sharedPreferences.setString("photoUrl", user.displayName);
//      } else {
//        await _sharedPreferences.setString("id", documents[0]['id']);
//        await _sharedPreferences.setString(
//            "username", documents[0]['username']);
//        await _sharedPreferences.setString(
//            "photoUrl", documents[0]['photoUrl']);
//      }
//
//      Fluttertoast.showToast(msg: "Sign In Successful");
//      setState(() {
//        loading = false;
//      });
//      Navigator.pushReplacement(
//          context, MaterialPageRoute(builder: (context) => HomePage()));
//    } else {
//      Fluttertoast.showToast(msg: "Sign In Failed");
//    }
//  }

  //For Sign Up
  Future<FirebaseUser> handleSignUp() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });

    final FirebaseUser firebaseUser =
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: "xyz@gmail.com", password: "123456");

    if (firebaseUser != null) {
      final QuerySnapshot result = await _firestore
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();

      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        //insert the user to database
        _firestore.collection("users").document(firebaseUser.uid).setData({
          "id": firebaseUser.uid,
          "username": firebaseUser.email,
//          "profilePicture": firebaseUser.photoUrl
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }

    setState(() {
      loading = false;
    });
  }

  //For Sign In
//  Future<FirebaseUser> handleSignIn() async {
//    _sharedPreferences = await SharedPreferences.getInstance();
//    setState(() {
//      loading = true;
//    });
//
//    final FirebaseUser firebaseUser = await _firebaseAuth
//        .signInWithEmailAndPassword(email: "xyz@gmail.com", password: "123456");
//
//    if (firebaseUser != null) {
//      final QuerySnapshot result = await _firestore
//          .collection("users")
//          .where("id", isEqualTo: firebaseUser.uid)
//          .getDocuments();
//
//      final List<DocumentSnapshot> documents = result.documents;
//      Navigator.pushReplacement(
//          context, MaterialPageRoute(builder: (context) => HomePage()));
//    }
//
//    setState(() {
//      loading = false;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: new Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: FlatButton(
                color: Colors.red.shade900,
                onPressed: () {
                  _handleSignIn();
                },
                child: new Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Center(
              child: FlatButton(
                  color: Colors.red.shade900,
                  onPressed: () {
                    handleSignUp();
                  },
                  child: new Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          new Visibility(
              visible: loading ?? true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.7),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
