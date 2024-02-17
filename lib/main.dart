import 'package:flutter/material.dart';

final List<String> _operations = ['+', '-', 'x', '÷', '='];
final List<String> _buttons = [
  // First row
  '7',
  '8',
  '9',
  '÷',

  // Second row
  '4',
  '5',
  '6',
  'x',

  // Third row
  '1',
  '2',
  '3',
  '-',

  // Fourth row
  '0',
  '.',
  '=',
  '+',
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(16),
                child: const Text('0', style: TextStyle(fontSize: 48),),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                padding: const EdgeInsets.all(5),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: _buttons.map((String value) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: (_operations.contains(value))
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey[400],
                    ),
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: (_operations.contains(value)) ? Colors.white  : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}