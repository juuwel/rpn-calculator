import 'package:calculator/logic/calculations.dart';

final List<String> operations = [
  '+',
  '-',
  'x',
  '÷',
  '√',
  'xⁿ',
  'x!',
  '1/x',
];

final List<String> utilityOperations = [
  'Enter',
  '←',
  'Pop',
  '+/-',
  'AC',
  'Undo',
];

final List<String> buttons = [
  // Zeroth row
  'AC',
  'Pop',
  'Undo',
  '+/-',
  '←',

  // First row
  '7',
  '8',
  '9',
  '÷',
  'xⁿ',

  // Second row
  '4',
  '5',
  '6',
  'x',
  '√',

  // Third row
  '1',
  '2',
  '3',
  '-',
  'x!',

  // Fourth row
  '0',
  '.',
  'Enter',
  '1/x',
  '+',
];

final Map<String, Command> commands = {
  '+': AddCommand(),
  '-': SubtractCommand(),
  'x': MultiplicationCommand(),
  '÷': DivisionCommand(),
  'xⁿ': ToPowerCommand(),
  '√': SquareRootCommand(),
  'x!': FactorialCommand(),
  '1/x': InvertCommand(),
};