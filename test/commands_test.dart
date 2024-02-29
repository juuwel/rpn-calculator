// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calculator/calculations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddCommand', () {
    test('Apply success', () {
      final List<num> stack = [1, 2];
      final command = AddCommand();
      command.apply(stack);
      expect(stack, [3]);
    });

    test('Apply with not enough operands should throw an exception', () {
      final List<num> stack = [1];
      final command = AddCommand();
      expect(() => command.apply(stack), _throwsExceptionWithMessage('Exception: Not enough operands'));
    });
  });

  group('SubtractCommand', () {
    test('Apply success', () {
      final List<num> stack = [1, 2];
      final command = SubtractCommand();
      command.apply(stack);
      expect(stack, [-1]);
    });

    test('Apply with not enough operands should throw an exception', () {
      final List<num> stack = [1];
      final command = SubtractCommand();
      expect(() => command.apply(stack), _throwsExceptionWithMessage('Exception: Not enough operands'));
    });
  });

  group('MultiplicationCommand', () {
    test('Apply success', () {
      final List<num> stack = [2, 3];
      final command = MultiplicationCommand();
      command.apply(stack);
      expect(stack, [6]);
    });

    test('Apply with not enough operands should throw an exception', () {
      final List<num> stack = [1];
      final command = MultiplicationCommand();
      expect(() => command.apply(stack), _throwsExceptionWithMessage('Exception: Not enough operands'));
    });
  });

  group('DivisionCommand', () {
    test('Apply success', () {
      final List<num> stack = [6, 3];
      final command = DivisionCommand();
      command.apply(stack);
      expect(stack, [2.0]);
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
    test('To power of 2', () {
      final List<num> stack = [4, 2];
      final command = ToPowerCommand();
      command.apply(stack);
      expect(stack, [16]);
    });

    test('Apply with 0 should throw an exception', () {
      final List<num> stack = [6];
      final command = ToPowerCommand();
      expect(() => command.apply(stack), _throwsExceptionWithMessage('Exception: Not enough operands'));
    });
  });

  group('Utility commands', () {
    test('Clear', () {
      final List<num> stack = [1, 2, 3];
      final command = ClearCommand();
      command.apply(stack);
      expect(stack, []);
    });

    test('Backspace', () {
      final List<num> stack = [1, 2, 3];
      final command = BackspaceCommand();
      command.apply(stack);
      expect(stack, [1, 2]);
    });
  });
}

Matcher _throwsExceptionWithMessage(String message) {
  return throwsA(
      isA<Exception>().having((e) => e.toString(), 'message', message)
  );
}