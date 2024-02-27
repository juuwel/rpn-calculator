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
          seedColor: Colors.purple,
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

    setState(() {
      command.apply(stack);
    });
  }

  _onButtonPressed(String value) {
    if (operations.contains(value)) {
      _applyCommand(value);
    } else {
      _addNumberToStack(value);
    }
  }
}
