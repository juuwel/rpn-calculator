import 'package:calculator/components/calc_button.dart';
import 'package:calculator/data.dart';
import 'package:flutter/material.dart';

class Numpad extends StatelessWidget {
  final Function(String) onButtonPressed;

  const Numpad({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final buttonSize = constraints.maxHeight / 5;

      return GridView.count(
        crossAxisCount: 5,
        padding: const EdgeInsets.all(5),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: buttonSize / buttonSize,
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