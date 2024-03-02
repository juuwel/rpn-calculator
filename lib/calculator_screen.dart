import 'package:calculator/calculations.dart';
import 'package:calculator/display.dart';
import 'package:calculator/numpad.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  final String numberToAdd;
  final List<num> stack;
  final List<Command> executedCommands;
  final Function(String) onButtonPressed;

  const CalculatorScreen(
      {super.key,
      required this.numberToAdd,
      required this.stack,
      required this.executedCommands,
      required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 768) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Calculator',
          theme: _buildThemeData(),
          home: Scaffold(
            body: _buildBody(),
          ),
        );
      } else {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Calculator',
          theme: _buildThemeData(),
          home: Scaffold(
            body: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 768),
              child: _buildBody(),
            ),
          ),
        );
      }
    });
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      // Define the default brightness and colors.
      colorScheme: ColorScheme.fromSeed(
        primary: Colors.blue,
        secondary: Colors.blueGrey,
        seedColor: Colors.blue,
        // ···
        brightness: Brightness.dark,
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Display(numberToAdd: numberToAdd, stack: stack),
          Numpad(onButtonPressed: onButtonPressed),
        ],
      ),
    );
  }
}
