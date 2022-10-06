import 'package:calculator/assignment.dart';
import 'package:calculator/components/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userinput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  CaesarCipher()));
              },
              child: const Text(
                'Assignment',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ))
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(userinput.toString(),
                            style:
                                TextStyle(fontSize: 40, color: Colors.white)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(answer.toString(),
                            style:
                                TextStyle(fontSize: 35, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          onPress: () {
                            userinput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+/-',
                          onPress: () {
                            userinput += '+/-';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '%',
                          onPress: () {
                            userinput += '%';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '/',
                          onPress: () {
                            userinput += '/';
                            setState(() {});
                          },
                          color: Colors.deepOrange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          onPress: () {
                            userinput += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '8',
                          onPress: () {
                            userinput += '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '9',
                          onPress: () {
                            userinput += '9';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'x',
                          onPress: () {
                            userinput += 'x';
                            setState(() {});
                          },
                          color: Colors.deepOrange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          onPress: () {
                            userinput += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '5',
                          onPress: () {
                            print('ok');
                            userinput += '5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '6',
                          onPress: () {
                            userinput += '6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '-',
                          onPress: () {
                            userinput += '-';
                            setState(() {});
                          },
                          color: Colors.deepOrange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          onPress: () {
                            userinput += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '2',
                          onPress: () {
                            userinput += '2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '3',
                          onPress: () {
                            userinput += '3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+',
                          onPress: () {
                            userinput += '+';
                            setState(() {});
                          },
                          color: Colors.deepOrange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '0',
                          onPress: () {
                            userinput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '.',
                          onPress: () {
                            userinput += '.';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'DEL',
                          onPress: () {
                            userinput =
                                userinput.substring(0, userinput.length - 1);
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '=',
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                          color: Colors.deepOrange,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    print('ok');
    final finalUserinput = userinput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserinput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, ContextModel());
    answer = eval.toString();
  }
}
