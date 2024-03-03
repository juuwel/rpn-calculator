// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calculator/logic/calculations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddCommand', () {
    test('Add with positive numbers', () {
      final List<num> stack = [1, 2];
      final command = AddCommand();
      command.apply(stack);
      expect(stack, [3]);
    });

    test('Add with negative numbers', () {
      final List<num> stack = [-1, -2];
      final command = AddCommand();
      command.apply(stack);
      expect(stack, [-3]);
    });

    test('Add with mixed numbers', () {
      final List<num> stack = [-1, 2];
      final command = AddCommand();
      command.apply(stack);
      expect(stack, [1]);
    });

    test('Add with not enough operands should throw an exception', () {
      final List<num> stack = [1];
      final command = AddCommand();
      expect(() => command.apply(stack), _throwsExceptionWithMessage('Exception: Not enough operands'));
    });
  });

  group('SubtractCommand', () {
    test('Subtract with positive numbers', () {
      final List<num> stack = [1, 2];
      final command = SubtractCommand();
      command.apply(stack);
      expect(stack, [-1]);
    });

    test('Subtract with negative numbers', () {
      final List<num> stack = [-1, -2];
      final command = SubtractCommand();
      command.apply(stack);
      expect(stack, [1]);
    });

    test('Subtract with mixed numbers', () {
      final List<num> stack = [-1, 2];
      final command = SubtractCommand();
      command.apply(stack);
      expect(stack, [-3]);
    });

    test('Apply with not enough operands should throw an exception', () {
      final List<num> stack = [1];
      final command = SubtractCommand();
      expect(() => command.apply(stack), _throwsExceptionWithMessage('Exception: Not enough operands'));
    });
  });

  group('MultiplicationCommand', () {
    test('Multiplication with positive numbers', () {
      final List<num> stack = [2, 3];
      final command = MultiplicationCommand();
      command.apply(stack);
      expect(stack, [6]);
    });

    test('Multiplication with negative numbers', () {
      final List<num> stack = [-2, -3];
      final command = MultiplicationCommand();
      command.apply(stack);
      expect(stack, [6]);
    });

    test('Multiplication with mixed numbers', () {
      final List<num> stack = [2, -3];
      final command = MultiplicationCommand();
      command.apply(stack);
      expect(stack, [-6]);
    });

    test('Apply with not enough operands should throw an exception', () {
      final List<num> stack = [1];
      final command = MultiplicationCommand();
      expect(() => command.apply(stack), _throwsExceptionWithMessage('Exception: Not enough operands'));
    });
  });

  group('DivisionCommand', () {
    test('Division with positive numbers', () {
      final List<num> stack = [6, 3];
      final command = DivisionCommand();
      command.apply(stack);
      expect(stack, [2.0]);
    });

    test('Division with negative numbers', () {
      final List<num> stack = [-6, -3];
      final command = DivisionCommand();
      command.apply(stack);
      expect(stack, [2.0]);
    });

    test('Division with mixed numbers', () {
      final List<num> stack = [6, -3];
      final command = DivisionCommand();
      command.apply(stack);
      expect(stack, [-2.0]);
    });

    test('Apply with not enough operands should throw an exception', () {
      final List<num> stack = [1];
      final command = DivisionCommand();
      expect(() => command.apply(stack), _throwsExceptionWithMessage('Exception: Not enough operands'));
    });

    test('Apply with 0 should throw an exception', () {
      final List<num> stack = [6, 0];
      final command = DivisionCommand();
      expect(() => command.apply(stack), _throwsExceptionWithMessage('Exception: Cannot divide by zero'));
    });
  });

  group('To Power', () {
    test('4 to power of 2', () {
      final List<num> stack = [4, 2];
      final command = ToPowerCommand();
      command.apply(stack);
      expect(stack, [16]);
    });

    test('4 to power of -2', () {
      final List<num> stack = [4, -2];
      final command = ToPowerCommand();
      command.apply(stack);
      expect(stack, [1/16]);
    });

    test('4 to power of -1', () {
      final List<num> stack = [4, -1];
      final command = ToPowerCommand();
      command.apply(stack);
      expect(stack, [1/4]);
    });

    test('4 to power of 1', () {
      final List<num> stack = [4, 1];
      final command = ToPowerCommand();
      command.apply(stack);
      expect(stack, [4]);
    });

    test('4 to power of 0', () {
      final List<num> stack = [4, 1];
      final command = ToPowerCommand();
      command.apply(stack);
      expect(stack, [4]);
    });

    test('-4 to power of -1', () {
      final List<num> stack = [-4, -1];
      final command = ToPowerCommand();
      command.apply(stack);
      expect(stack, [-1/4]);
    });

    test('Apply with 0 should throw an exception', () {
      final List<num> stack = [6];
      final command = ToPowerCommand();
      expect(() => command.apply(stack), _throwsExceptionWithMessage('Exception: Not enough operands'));
    });
  });

  group('Square root', () {
    test('Square root of 4', () {
      final List<num> stack = [4];
      final command = SquareRootCommand();
      command.apply(stack);
      expect(stack, [2.0]);
    });

    test('Square root of -4 should throw an exception', () {
      final List<num> stack = [-4];
      final command = SquareRootCommand();
      expect(() => command.apply(stack), _throwsExceptionWithMessage('Exception: Cannot calculate square root of a negative number'));
    });
  });

  group('Factorial', () {
    test('Factorial of 4', () {
      final List<num> stack = [4];
      final command = FactorialCommand();
      command.apply(stack);
      expect(stack, [24]);
    });

    test('Factorial of 0', () {
      final List<num> stack = [0];
      final command = FactorialCommand();
      command.apply(stack);
      expect(stack, [1]);
    });

    test('Factorial of -4 should throw an exception', () {
      final List<num> stack = [-4];
      final command = FactorialCommand();
      expect(() => command.apply(stack), _throwsExceptionWithMessage('Exception: Cannot calculate factorial of a negative number'));
    });
  });

  group('InvertCommand', () {
    test('Invert positive number', () {
      final List<num> stack = [4];
      final command = InvertCommand();
      command.apply(stack);
      expect(stack, [0.25]);
    });

    test('Invert negative number', () {
      final List<num> stack = [-4];
      final command = InvertCommand();
      command.apply(stack);
      expect(stack, [-0.25]);
    });

    test('Invert 0 should throw an exception', () {
      final List<num> stack = [0];
      final command = InvertCommand();
      expect(() => command.apply(stack), _throwsExceptionWithMessage('Exception: Cannot divide by zero'));
    });
  });

  group('Commands', () {
    test('Commands should be able to be executed', () {
      final List<num> stack = [1, 2];
      final List<Command> executedCommands = [];
      final command = AddCommand();
      command.apply(stack);
      executedCommands.add(command);
      expect(stack, [3]);
      expect(executedCommands, [command]);
    });
  });
}

Matcher _throwsExceptionWithMessage(String message) {
  return throwsA(
      isA<Exception>().having((e) => e.toString(), 'message', message)
  );
}