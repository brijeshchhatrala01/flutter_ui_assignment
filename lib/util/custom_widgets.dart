import 'package:flutter/material.dart';

import '../pages/registerpage.dart';

class CustomWidgets {
  static alertBox(BuildContext context,String content,VoidCallback onPressed) {
    return showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text(content),
          actions: [
            ElevatedButton(onPressed: onPressed, child: Text("OK"))
          ],
        );
    },);
  }
  
  static customTextFormField(BuildContext context,String hintText,TextEditingController controller,bool isPass){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      obscureText: isPass,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white,letterSpacing: 2),
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white,letterSpacing: 2)
      ),
    );
  }

  static customButton(BuildContext context,VoidCallback onPressed,String buttonName) {
    return ElevatedButton(onPressed: onPressed, child: Text(buttonName,
      style: TextStyle(
          letterSpacing: 3,
          color: Colors.deepPurple[300],
          fontSize: 16,
          fontStyle: FontStyle.normal),
    ));
  }

  static customRadio(Gender genderValue,Gender groupValue, Function(Gender? gender)? onChanged){
    return Radio(value: genderValue, groupValue: groupValue, onChanged: onChanged);
  }

  static customCheckBox(bool checkedValue,Function(bool?)? onChanged){
    return Checkbox(value: checkedValue, onChanged: onChanged);
  }
}
