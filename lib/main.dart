import 'package:calculator/components/calculator_screen.dart';
import 'package:calculator/components/display.dart';
import 'package:calculator/components/numpad.dart';
import 'package:calculator/data.dart';
import 'package:calculator/logic/calculations.dart';
import 'package:flutter/material.dart';

// TODO: overflow with long results
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<num> stack = [];
  final List<Command> executedCommands = [];
  String numberToAdd = '0';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CalculatorScreen(
      numberToAdd: numberToAdd,
      stack: stack,
      executedCommands: executedCommands,
      onButtonPressed: _onButtonPressed,
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Display(numberToAdd: numberToAdd, stack: stack),
          Numpad(onButtonPressed: _onButtonPressed),
        ],
      ),
    );
  }

  _applyCommand(String value) {
    var command = commands[value]!;
    try {
      setState(() {
        command.apply(stack);
        executedCommands.add(command);
      });
    } on Exception catch (e) {
      if (e.toString() == 'Exception: Not enough operands') {
        return;
      }
      rethrow;
    }
  }

  _onButtonPressed(String value) {
    // Utility operations
    if (utilityOperations.contains(value)) {
      _handleUtilityOperations(value);
      return;
    } else if (operations.contains(value)) {
      if (stack.isNotEmpty && numberToAdd != '0') {
        // In order to allow the user to make a calculation with the number that is currently being typed
        stack.add(num.parse(numberToAdd));
        numberToAdd = '0';
      }
      _applyCommand(value);
    } else {
      if (value == '.') {
        if (!numberToAdd.contains('.')) {
          setState(() {
            numberToAdd += value;
          });
        }
        return;
      }

      var numericValue = num.tryParse(value);
      if (numericValue == null) return;

      setState(() {
        if (numberToAdd == '0') {
          numberToAdd = value;
        } else {
          numberToAdd += value;
        }
      });
    }
  }

  void _handleUtilityOperations(String value) {
    switch (value) {
      case 'Enter':
        if (numberToAdd != '0') {
          setState(() {
            stack.add(num.parse(numberToAdd));
            numberToAdd = '0';
          });
        }
        break;
      case 'Revert':
        if (executedCommands.isNotEmpty) {
          setState(() {
            var command = executedCommands.removeLast();
            command.unapply(stack);
          });
        }
        break;
      case '+/-':
        if (numberToAdd == '0') {
          setState(() {
            numberToAdd = '-';
          });
        } else if (numberToAdd.startsWith('-')) {
          setState(() {
            numberToAdd = numberToAdd.substring(1);
          });
        } else {
          setState(() {
            numberToAdd = '-$numberToAdd';
          });
        }
        break;
      case 'AC':
        setState(() {
          stack.clear();
          numberToAdd = '0';
          executedCommands.clear();
        });
        break;
      case '←':
        setState(() {
          if (numberToAdd.length > 1) {
            numberToAdd = numberToAdd.substring(0, numberToAdd.length - 1);
          } else {
            numberToAdd = '0';
          }
        });
        break;
      case 'Pop':
        setState(() {
          if (stack.isNotEmpty) {
            stack.removeLast();
          }
        });
        break;
      case 'Undo':
        setState(() {
          if (executedCommands.isNotEmpty) {
            var command = executedCommands.removeLast();
            command.unapply(stack);
          }
        });
        break;
      case '1/x':
        if (numberToAdd == '0') {
          return;
        }
        setState(() {
          numberToAdd = (1 / num.parse(numberToAdd)).toString();
        });
        break;
    }
  }
}
