import 'package:flutter/material.dart';
import 'package:fluttercalculatorapp/utils/colors.dart';
import 'package:fluttercalculatorapp/widgets/button_widgets.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var listaCalculatorNum = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
  var listaCalculatorOper = ['AC', '<', '', '/', 'x', '-', '+', '=', '%', '.','='];

  double firstNum = 0.0;
  double secondNum = 0.0;

  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 34.0;

  onButtonClick(value) {
    // if value is AC 
    if(value == 'AC') {
      input = '';
      output = '';
    } else if (value == "<") {
      if(input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if(input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if(output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideInput = true;
        outputSize = 52;
      }
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 34;
    }

    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Calculadora", style: TextStyle(color: txtColor)),
      ),
      body: Column(
        children: [
          // input output area
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideInput ? '' : input,
                    style: const TextStyle(
                      fontSize: 48,
                      color: txtColor,
                    ) ,
                  ),
                  const SizedBox(
                     height: 20,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                      fontSize: outputSize,
                      color: txtColor.withOpacity(0.7),
                    ) ,
                  ),
                  const SizedBox(
                     height: 20,
                  ),
                ],
              ),
            ),
          ),
          // button area
          Row(
            children: [
              ButtonWidgets(
                textButton: 'AC',
                buttonBgColor: operatorColor,
                textColor: orangeColor,
                onPressed: (() => onButtonClick(listaCalculatorOper[0])),
              ),
              ButtonWidgets(
                textButton: '<',
                buttonBgColor: operatorColor,
                textColor: orangeColor,
                onPressed: (() => onButtonClick(listaCalculatorOper[1])),
              ),
              ButtonWidgets(
                textButton: '',
                buttonBgColor: Colors.transparent,
              ),
              ButtonWidgets(
                textButton: '/',
                buttonBgColor: operatorColor,
                textColor: orangeColor,
                onPressed: (() => onButtonClick(listaCalculatorOper[3])),
              ),
            ],
          ),
          Row(
            children: [
              ButtonWidgets(
                textButton: listaCalculatorNum[6],
                onPressed: (() => onButtonClick(listaCalculatorNum[6])),
              ),
              ButtonWidgets(
                textButton: listaCalculatorNum[7],
                onPressed: (() => onButtonClick(listaCalculatorNum[7])),
              ),
              ButtonWidgets(
                textButton: listaCalculatorNum[8],
                onPressed: (() => onButtonClick(listaCalculatorNum[8])),
              ),
              ButtonWidgets(
                textButton: 'x',
                buttonBgColor: operatorColor,
                textColor: orangeColor,
                onPressed: (() => onButtonClick(listaCalculatorOper[4])),
              ),
            ],
          ),
          Row(
            children: [
              ButtonWidgets(
                textButton: listaCalculatorNum[3],
                onPressed: (() => onButtonClick(listaCalculatorNum[3])),
              ),
              ButtonWidgets(
                textButton: listaCalculatorNum[4],
                onPressed: (() => onButtonClick(listaCalculatorNum[4])),
              ),
              ButtonWidgets(
                textButton: listaCalculatorNum[5],
                onPressed: (() => onButtonClick(listaCalculatorNum[5])),
              ),
              ButtonWidgets(
                textButton: '-',
                buttonBgColor: operatorColor,
                textColor: orangeColor,
                onPressed: (() => onButtonClick(listaCalculatorOper[5])),
              ),
            ],
          ),
          Row(
            children: [
              ButtonWidgets(
                textButton: listaCalculatorNum[0],
                onPressed: (() => onButtonClick(listaCalculatorNum[0])),
              ),
              ButtonWidgets(
                textButton: listaCalculatorNum[1],
                onPressed: (() => onButtonClick(listaCalculatorNum[1])),
              ),
              ButtonWidgets(
                textButton: listaCalculatorNum[2],
                onPressed: (() => onButtonClick(listaCalculatorNum[2])),
              ),
              ButtonWidgets(
                textButton: '+',
                buttonBgColor: operatorColor,
                textColor: orangeColor,
                onPressed: (() => onButtonClick(listaCalculatorOper[6])),
              ),
            ],
          ),
          Row(
            children: [
              ButtonWidgets(
                textButton: '%',
                buttonBgColor: operatorColor,
                textColor: orangeColor,
                onPressed: (() => onButtonClick(listaCalculatorOper[8])),
              ),
              ButtonWidgets(
                textButton: listaCalculatorNum[9],
                onPressed: (() => onButtonClick(listaCalculatorNum[9])),
              ),
              ButtonWidgets(
                textButton: '.',
                buttonBgColor: operatorColor,
                textColor: orangeColor,
                onPressed: (() => onButtonClick(listaCalculatorOper[9])),
              ),
              ButtonWidgets(
                textButton: '=',
                buttonBgColor: orangeColor,
                onPressed: (() => onButtonClick(listaCalculatorOper[10])),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
