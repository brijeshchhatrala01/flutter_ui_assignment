
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment/pages/checkuserlogin.dart';
import 'package:flutter_ui_assignment/pages/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCfqDvCKSHUihBM4eH_Mt_zCPwKSIHdgq0",
        appId:  "1:668111518716:android:6dfade765cbb78742c9079",
        messagingSenderId: "668111518716",
        projectId: "fir-tutorial-81059")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.deepPurpleAccent,
          appBarTheme: AppBarTheme( backgroundColor:  Colors.deepPurple[800],
            actionsIconTheme: const IconThemeData(color: Colors.white),
            iconTheme: const IconThemeData(color: Colors.white),
            centerTitle: true,),
          iconButtonTheme: const IconButtonThemeData(style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white))),
          iconTheme: const IconThemeData(color: Colors.white),
          radioTheme: const RadioThemeData(fillColor: MaterialStatePropertyAll(Colors.white)),
          checkboxTheme: const CheckboxThemeData(checkColor: MaterialStatePropertyAll(Colors.white))
      ),
      debugShowCheckedModeBanner: false,
      home: CheckUserLogin(),
    );
  }
}
