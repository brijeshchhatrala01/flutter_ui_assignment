import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment/util/radio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Operations { Addition, Substraction, Multiplication, Division }

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final valueOne = TextEditingController();
  final valueTwo = TextEditingController();

  String result = "";

  _additionOfNum() {
    double val1 = double.parse(valueOne.text.toString());
    double val2 = double.parse(valueTwo.text.toString());

    result = "${val1 + val2}";
  }

  _subStractionOfNum() {
    double val1 = double.parse(valueOne.text.toString());
    double val2 = double.parse(valueTwo.text.toString());

    result = "${val1 - val2}";
  }

  _multiPlication() {
    double val1 = double.parse(valueOne.text.toString());

    double val2 = double.parse(valueTwo.text.toString());

    result = "${val1 * val2}";
  }

  _divisionOfNum() {
    double val1 = double.parse(valueOne.text.toString());
    double val2 = double.parse(valueTwo.text.toString());

    result = "${val1 / val2}";
  }

  Operations op = Operations.Addition;

  String? isNullValidator(String? val) {
    return val!.isEmpty ? "Enter any value" : null;
  }

  //print result
  _printResult() {
    setState(() {
      switch (op) {
        case Operations.Addition:
          _additionOfNum();
        case Operations.Substraction:
          _subStractionOfNum();
        case Operations.Multiplication:
          _multiPlication();
        case Operations.Division:
          _divisionOfNum();
        default:
          _additionOfNum();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Homepage")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Value One'),
                    controller: valueOne,
                    validator: isNullValidator,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: valueTwo,
                    validator: isNullValidator,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Value Two'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        RadioButton(
                          title: "Additon",
                          value: Operations.Addition,
                          groupValue: op,
                          onChanged: (Operations? val) {
                            setState(() {
                              op = val!;
                              //_additionOfNum();
                            });
                          },
                        ),
                        RadioButton(
                          title: "Substraction",
                          value: Operations.Substraction,
                          groupValue: op,
                          onChanged: (Operations? val) {
                            setState(() {
                              op = val!;
                              //_subStractionOfNum();
                            });
                          },
                        ),
                        RadioButton(
                          title: "Multiplication",
                          value: Operations.Multiplication,
                          groupValue: op,
                          onChanged: (Operations? val) {
                            setState(() {
                              op = val!;
                              //_multiPlication();
                            });
                          },
                        ),
                        RadioButton(
                          title: "Division",
                          value: Operations.Division,
                          groupValue: op,
                          onChanged: (Operations? val) {
                            setState(() {
                              op = val!;
                              //_divisionOfNum();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _printResult();
                        } else {
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(
                                const SnackBar(content: Text('Enter Values')));
                        }
                      },
                      child: const Text("Answer")),
                  Text(
                    result,
                    style: const TextStyle(
                        letterSpacing: 2.0,
                        backgroundColor: Colors.yellow,
                        fontSize: 22,
                        color: Colors.orange),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}