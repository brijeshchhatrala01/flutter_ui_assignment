import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment/pages/loginpage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage",style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: () {
            GoogleSignIn().signOut();
            FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),)));
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("Welcome To HomePage"),
      ),
    );
  }
}