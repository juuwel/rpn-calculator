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
          color: _getButtonColor(value, context),
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

  _getButtonColor(String value, BuildContext context) {
    if (operations.contains(value)) {
      return Theme.of(context).colorScheme.primary;
    } else if (utilityOperations.contains(value)) {
      return Theme
          .of(context)
          .colorScheme
          .secondary;
    } else {
      return Colors.grey[400];
    }
  }
}
