import 'package:calculator/calc_button.dart';
import 'package:calculator/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<num> stack = [5, 3];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.blue,
          secondary: Colors.blueGrey,
          seedColor: Colors.blue,
          // ···
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildDisplay(),
            buildNumpad(context),
          ],
        ),
      ),
    );
  }

  Widget buildNumpad(BuildContext context) {
    return Expanded(
      flex: 5,
      child: GridView.count(
        crossAxisCount: 4,
        padding: const EdgeInsets.all(5),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: buttons.map((String value) {
          return CalculatorButton(
            value: value,
            onPressed: (value) => _onButtonPressed(value),
          );
        }).toList(),
      ),
    );
  }

  Widget buildDisplay() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(16),
          child: Text(
            stack.join(' '),
            style: const TextStyle(fontSize: 48),
          ),
        ),
      ),
    );
  }

  _addNumberToStack(String value) {
    var numericValue = num.tryParse(value);
    if (numericValue == null) return;

    setState(() {
      stack.add(numericValue);
    });
  }

  _applyCommand(String value) {
    var command = commands[value]!;
    try {
      setState(() {
        command.apply(stack);
      });
    } on Exception catch (e) {
      if (e.toString() == 'Exception: Not enough operands') {
       return;
      }
      rethrow;
    }
  }

  _onButtonPressed(String value) {
    if (operations.contains(value) || utilityOperations.contains(value)) {
      _applyCommand(value);
    } else {
      _addNumberToStack(value);
    }
  }
}
