import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'loginpage.dart';
class CheckUserLogin extends StatefulWidget {
  const CheckUserLogin({super.key});

  @override
  State<CheckUserLogin> createState() => _CheckUserLoginState();
}

class _CheckUserLoginState extends State<CheckUserLogin> {

  _switchScreen(){
    final user = FirebaseAuth.instance.currentUser;
    if(user != null){
      return HomePage();
    }
    else{
      return LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _switchScreen();
  }
}
