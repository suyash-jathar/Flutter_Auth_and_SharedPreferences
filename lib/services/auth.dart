import 'package:flutter_auth_shared_preferences_1/Local%20DB/localdb.dart';
import 'package:flutter_auth_shared_preferences_1/views/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

// Sign In Fn
Future<User?> sigInWithGoogle() async {
//  Sign In With Google
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

// Creating Credntial for firebase
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

// Sign in with Credendtial & making a user in Firebase and getting User Class
    final userCredential = await _auth.signInWithCredential(credential);
    final User? user = userCredential.user;

// Checking Purpose
    assert(!user!.isAnonymous);
    assert(await user!.getIdToken() != null);

    final User? currentUser = await _auth.currentUser;
    assert(currentUser!.uid == user!.uid);
    print(user);
    LocalDataSaver.saveLoginData(true);
    LocalDataSaver.saveName(user!.displayName.toString());
    LocalDataSaver.saveEmail(user.email.toString());
    LocalDataSaver.saveImg(user.photoURL.toString());
    return user;
  } catch (e) {
    print(e);
  }
}

Future<String> signOut(context) async {
  await googleSignIn.signOut();
  await _auth.signOut();
  LocalDataSaver.saveLoginData(false);
  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Login()));
  return "SUCCESS";
}
