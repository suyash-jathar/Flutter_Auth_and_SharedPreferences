import 'package:flutter/material.dart';
import 'package:flutter_auth_shared_preferences_1/Local%20DB/localdb.dart';
import 'package:flutter_auth_shared_preferences_1/contsants.dart';
import 'package:flutter_auth_shared_preferences_1/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOme Page"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(backgroundImage: NetworkImage(constant.img),),
              SizedBox(height: 10,),
              Text(constant.name),
              SizedBox(height: 10,),
              Text(constant.email),
              SizedBox(height: 10,),
              ElevatedButton(
                child: Text("Sign Out"),
                onPressed: ()async{
                  await signOut(context);
                })
            ],
          ),
        ),
      )
    );
  }
}