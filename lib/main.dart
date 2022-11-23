import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_shared_preferences_1/Local%20DB/localdb.dart';
import 'package:flutter_auth_shared_preferences_1/views/login.dart';
import 'package:flutter_auth_shared_preferences_1/views/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogIn=false;

  getLoggedInState()async {
    await LocalDataSaver.getLogData().then((logInStatus) {
      setState(() {
        isLogIn=logInStatus!; 
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoggedInState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: isLogIn ? Profile() : Login(),
    );
  }
}
