import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment/pages/forgotpassword.dart';
import 'package:flutter_ui_assignment/pages/homepage.dart';
import 'package:flutter_ui_assignment/pages/registerpage.dart';
import 'package:flutter_ui_assignment/util/custom_widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //for eye password
  bool isObsecureText = true;
  final emailText = TextEditingController();
  final passText = TextEditingController();

  //login method
  _checkUserLogin(String email,String pass) async{
    if(email == "" && pass == ""){
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: const Text("Please Enter Email & Password"),
          actions: [
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: const Text("OK"))
          ],
        );
      },);
    }
    else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),)));
      }
      on FirebaseException catch(e){
        return showDialog(context: context, builder: (context) {
          return AlertDialog(
            content: Text(e.code.toString()),
            actions: [
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("OK"))
            ],
          );
        },);
      }
    }
  }

  //google login
  Future<dynamic> _googleLogin() async {
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleSignInAuthentication = await googleUser?.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication?.accessToken,
            idToken: googleSignInAuthentication?.idToken
        );
        return await FirebaseAuth.instance.signInWithCredential(credential).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),)));
        }
        on Exception catch (ex){

          print("Exception : ${ex}");
          return CustomWidgets.alertBox(context, ex.toString(), () {
            Navigator.pop(context);
          });
        }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
       title :Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Lottie.asset('Images/background_animation.json',
              width: double.infinity,
              fit: BoxFit.fill,
              height: double.infinity),
          SingleChildScrollView(
            child: Form(
                child: Padding(
              padding: const EdgeInsets.only(top: 65, right: 12, left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: SweepGradient(colors: [
                          Colors.white,
                          Colors.deepPurple.shade900
                        ])),
                    child: Lottie.asset(
                      'Images/icon_title.json',
                      height: 170,
                      width: 170,
                    ),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  CustomWidgets.customTextFormField(context, "Enter Email", emailText,false),
                  const SizedBox(
                    height: 42,
                  ),
                  TextFormField(
                    controller: passText,
                    obscureText: isObsecureText,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(color: Colors.white, letterSpacing: 2),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObsecureText = !isObsecureText;
                              });
                            },
                            icon: Icon(
                              isObsecureText
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                              color: Colors.white,
                            )),
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: "Enter Password",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          letterSpacing: 2,
                        )),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.only(left: 32, right: 32))),
                      onPressed: () {
                        _checkUserLogin(emailText.text.toString(), passText.text.toString());
                        
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            letterSpacing: 3,
                            color: Colors.deepPurple[300],
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                      )),
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword(),));
                  }, child: const Text("Forgot Password",style: TextStyle(color: Colors.indigoAccent,fontSize: 18),)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () async{
                           await _googleLogin();
                          },
                          icon: const Icon(Icons.mail),
                          label: Text(
                            "GOOGLE",
                            style: TextStyle(
                                letterSpacing: 3,
                                color: Colors.deepPurple[300],
                                fontSize: 16,
                                fontStyle: FontStyle.normal),
                          )),
                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook),
                          label: Text(
                            "FACEBOOK",
                            style: TextStyle(
                                letterSpacing: 3,
                                color: Colors.deepPurple[300],
                                fontSize: 16,
                                fontStyle: FontStyle.normal),
                          )),
                    ],
                  ),
                  const SizedBox(height: 42,),
                  ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
                      onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
                  }, child: Text("Register Hear",style: TextStyle(color: Colors.white,fontSize: 16),)),
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
