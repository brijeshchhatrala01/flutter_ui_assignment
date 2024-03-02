import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment/pages/homepage.dart';

class RadioButton extends StatelessWidget {
  final String title;
  final Operations value;
  final Operations groupValue;
  Function(Operations?)? onChanged;
  RadioButton(
      {super.key,
      required this.title,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(title),
        ),
        Radio(value: value, groupValue: groupValue, onChanged: onChanged),
      ],
    );
  }
}