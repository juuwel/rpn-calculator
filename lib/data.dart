import 'package:calculator/calculations.dart';

final List<String> operations = [
  '+',
  '-',
  'x',
  '÷',
  '√',
  'x²'
];

final List<String> utilityOperations = [
  'Enter',
  'C',
  '←',
  'Back',
  '+/-',
  'AC'
];

final List<String> buttons = [
  // Zeroth row
  'AC',
  'Back',
  '+/-',
  '←',
  '←',

  // First row
  '7',
  '8',
  '9',
  '÷',
  'x²',

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
  'Enter',

  // Fourth row
  '0',
  '0',
  '.',
  '+',
  'Enter',
];

final Map<String, Command> commands = {
  '+': AddCommand(),
  '-': SubtractCommand(),
  'x': MultiplicationCommand(),
  '÷': DivisionCommand(),
  'x²': ToPowerCommand(),
  'C': ClearCommand(),
  '←': BackspaceCommand(),
};