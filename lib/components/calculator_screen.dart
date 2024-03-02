import 'package:calculator/components/display.dart';
import 'package:calculator/components/numpad.dart';
import 'package:calculator/logic/calculations.dart';
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
      final height = constraints.maxHeight;
      if (true) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Calculator',
          theme: _buildThemeData(),
          home: Scaffold(
            body: _buildBody(height),
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

  Widget _buildBody(num height) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final screenHeight = constraints.maxHeight;
        final screenWidth = constraints.maxWidth;
        final numpadHeight = screenWidth / 5 * 5;
        final displayHeight = screenHeight - numpadHeight - 40; // top spacing

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(height: 40),
              SizedBox(
                height: displayHeight,
                child: Display(numberToAdd: numberToAdd, stack: stack),
              ),
              SizedBox(
                height: numpadHeight,
                child: Numpad(onButtonPressed: onButtonPressed),
              ),
            ],
          ),
        );
      },
    );
  }
}
