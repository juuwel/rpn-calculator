import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String numberToAdd;
  final List<num> stack;

  Display({super.key, required this.numberToAdd, required this.stack});

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              Text(
                "[ ${stack.join(', ')} ]",
                style: const TextStyle(fontSize: 48),
              ),
              Text(numberToAdd, style: const TextStyle(fontSize: 48)),
            ],
          ),
        ),
      ),
    );
  }
}
