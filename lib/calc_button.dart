import 'package:flutter/material.dart';
import 'package:calculator/data.dart';

class CalculatorButton extends StatelessWidget {
  final String value;
  final Function onPressed;

  const CalculatorButton(
      {super.key, required this.value, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(value),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:
              (operations.contains(value) || utilityOperations.contains(value))
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey[400],
        ),
        child: Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: (operations.contains(value) ||
                    utilityOperations.contains(value))
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
