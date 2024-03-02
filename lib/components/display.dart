import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String numberToAdd;
  final List<num> stack;

  const Display({super.key, required this.numberToAdd, required this.stack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              key: const Key("Display"),
              "[ ${stack.join(', ')} ]",
              style: const TextStyle(fontSize: 48),
            ),
            Text(
                key: const Key("NumberToAdd"),
                numberToAdd,
                style: const TextStyle(fontSize: 48)),
          ],
        ),
      ),
    );
  }
}
