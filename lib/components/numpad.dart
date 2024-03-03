import 'package:calculator/components/calc_button.dart';
import 'package:calculator/data.dart';
import 'package:flutter/material.dart';

class Numpad extends StatelessWidget {
  final Function(String) onButtonPressed;
  final double buttonAspectRatio;

  const Numpad({super.key, required this.onButtonPressed, required this.buttonAspectRatio });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final buttonSize = constraints.maxHeight / 5;

      return GridView.count(
        crossAxisCount: 5,
        padding: const EdgeInsets.all(5),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: buttonAspectRatio,
        children: buttons.map((String value) {
          return CalculatorButton(
            value: value,
            onPressed: (value) => onButtonPressed(value),
          );
        }).toList(),
      );
    });
  }
}
