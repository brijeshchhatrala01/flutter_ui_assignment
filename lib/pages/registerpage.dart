import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment/pages/homepage.dart';
import 'package:flutter_ui_assignment/util/custom_widgets.dart';
import 'package:lottie/lottie.dart';

//radio enum
enum Gender{
  Male,
  Female
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final nameText = TextEditingController();
  final emailText = TextEditingController();
  final passText = TextEditingController();
  final confirmPass = TextEditingController();

  var radioDefaultValue = Gender.Male;

  bool defaultCodingBool = false;
  bool defaultDesigningBool = false;
  bool defaultTestingBool = false;

  final _formKey = GlobalKey<FormState>();

  bool isObsecureText = true;

  bool? _isPasswordsMatched() {
    if(passText.text.toString() == confirmPass.text.toString()){
      return true;
    }
    else {
      return false;
    }
  }

  _signUpFirebase(String email,String pass) async{
    if(email == "" && pass == ""){
      CustomWidgets.alertBox(context, "Please Enter Details", () {
        Navigator.pop(context);
      });
    }
    else{
      UserCredential? userCredential;
      try{
        userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass).then((value) =>
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),)));
      }
      on FirebaseException catch(ex){
        CustomWidgets.alertBox(context, ex.code.toString(), () {
          Navigator.pop(context);
        });
      }
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
          key: _formKey,
        child: Padding(
        padding: const EdgeInsets.only(top: 35, right: 12, left: 12),
    child: SingleChildScrollView(
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
            CustomWidgets.customTextFormField(context, "Enter Name", nameText, false),
            const SizedBox(height: 22,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Gender : ",style: TextStyle(color: Colors.white,fontSize: 16),),
                CustomWidgets.customRadio(Gender.Male, radioDefaultValue,(gender) {
                  setState(() {
                    radioDefaultValue = gender!;
                  });
                },),
                const Text("Male",style: TextStyle(color: Colors.white,fontSize: 16),),
                CustomWidgets.customRadio(Gender.Female, radioDefaultValue,(gender) {
                  setState(() {
                    radioDefaultValue = gender!;
                  });
                },),
                const Text("Female",style: TextStyle(color: Colors.white,fontSize: 16),),
              ],
            ),
            const SizedBox(height: 22,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Hobbies : ",style: TextStyle(color: Colors.white,fontSize: 16),),
                const Text("Coding",style: TextStyle(fontSize: 16,color: Colors.white),),
                CustomWidgets.customCheckBox(defaultCodingBool, (value){
                  setState(() {
                    defaultCodingBool = !defaultCodingBool;
                  });
                }),
                const Text("Designing",style: TextStyle(fontSize: 16,color: Colors.white),),
                CustomWidgets.customCheckBox(defaultDesigningBool, (value){
                  setState(() {
                    defaultDesigningBool = !defaultDesigningBool;
                  });
                }),
              ],
            ),
            const SizedBox(height: 22,),
            CustomWidgets.customTextFormField(context, "Enter Email", emailText,false),
            const SizedBox(height: 22,),
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
            const SizedBox(height: 22,),
            TextFormField(
              controller: confirmPass,
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
                  hintText: "Enter Confirm Password",
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    letterSpacing: 2,
                  )),
            ),
            const SizedBox(height: 42,),
            CustomWidgets.customButton(context, () {
              if(_isPasswordsMatched()!){
                _signUpFirebase(emailText.text.toString(), passText.text.toString());
              }
              else{
                CustomWidgets.alertBox(context, "Password Doesn't match!", () {
                  Navigator.pop(context);
                });
              }
            }, "REGISTER")
          ],
        ),
    ),
    )
    )
    )
    ]));
  }
}
