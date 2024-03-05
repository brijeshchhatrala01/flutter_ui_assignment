import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../util/custom_widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final emailText = TextEditingController();

  _resetPassword() {
    if(emailText.text.isEmpty){
      return CustomWidgets.alertBox(context, "Please Enter an Email", () {
        Navigator.pop(context);
      });
    }
    else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: emailText.text.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Register",style: TextStyle(color: Colors.white),),
        ),
        body:

        Stack(
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
                            const SizedBox(height: 42,),
                            CustomWidgets.customTextFormField(context, "Email", emailText,false),
                            const SizedBox(height: 42,),
                            CustomWidgets.customButton(context, () {
                              _resetPassword();
                              ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(SnackBar(content: Text("Link Send To Your Email")));
                            }, "RESET PASSWORD")
                          ],
                        ),
                      )
                  )
              )
            ]));
  }
}
