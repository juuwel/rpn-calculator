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
];

final List<String> buttons = [
  // Zeroth row
  'x²',
  '√',
  'C',
  '←',

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
  'Enter',
  '+',
];

final Map<String, Command> commands = {
  '+': AddCommand(),
  '-': SubstractCommand(),
  'x': MultiplicationCommand(),
  '÷': DivisionCommand(),
  'x²': ToPowerCommand(),
  'C': ClearCommand(),
  '←': BackspaceCommand(),
  'Enter': EnterCommand(),
};