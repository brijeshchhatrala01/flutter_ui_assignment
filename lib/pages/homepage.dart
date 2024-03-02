import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment/pages/shownumber_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //declare controller
  final firstIntController = TextEditingController();
  final secondIntController = TextEditingController();

  //form global key
  final _formKey = GlobalKey<FormState>();

  String? _validator(String? val) {
    return val!.isEmpty ? "Plaese Enter Value" : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Homepage"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: _validator,
                    keyboardType: TextInputType.number,
                    controller: firstIntController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter First Intager"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: _validator,
                    keyboardType: TextInputType.number,
                    controller: secondIntController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Second Intager"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          int num1 =
                              int.parse(firstIntController.text.toString());
                          int num2 =
                              int.parse(secondIntController.text.toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowNumbers(
                                    firstNum: num1, secondNum: num2)),
                          );
                        }
                      },
                      child: const Text('Click Me'))
                ],
              )),
        ));
  }
}
