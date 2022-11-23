import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_shared_preferences_1/Local%20DB/localdb.dart';
import 'package:flutter_auth_shared_preferences_1/services/auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../contsants.dart';
import './profile.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  signIn(context)async
  {
    await sigInWithGoogle();
    constant.name=(await LocalDataSaver.getName())!;
    constant.email=(await LocalDataSaver.getEmail())!;
    constant.img=(await LocalDataSaver.getImg())!;
    SharedPreferences prefs= await SharedPreferences.getInstance();
    prefs.setString('alname', constant.name); 
    prefs.setString('alemail', constant.email); 
    prefs.setString('alimgUrl', constant.img); 
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Profile()));
  }
  
  Future<void> checkUserLog() async
{
  final FirebaseAuth auth = await FirebaseAuth.instance;
  final user = await auth.currentUser;
  if(user != null)
    {
      constant.name = (await LocalDataSaver.getName())!;
      constant.email = (await LocalDataSaver.getEmail())!;
      constant.img = (await LocalDataSaver.getImg())!;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()));
    }
}

  @override
  void initState(){

    checkUserLog();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login To App"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignInButton(
            Buttons.Google,
            onPressed: () async{
              signIn(context);
            },
          )
        ],
      )),
    );
  }
}
