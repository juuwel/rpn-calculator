import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Add should add two numbers', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.displayText(), '[  ]');

    await tester.tapByKey('1');
    await tester.tapByKey('3');
    await tester.tapByKey('Enter');
    expect(find.numberToAddText(), '0');

    await tester.tapByKey('2');
    await tester.tapByKey('+');
    expect(find.numberToAddText(), '0');

    expect(find.displayText(), '[ 15 ]');
  });

  testWidgets('Subtract should subtract two numbers', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.displayText(), '[  ]');

    await tester.tapByKey('1');
    await tester.tapByKey('3');
    await tester.tapByKey('Enter');
    expect(find.numberToAddText(), '0');

    await tester.tapByKey('2');
    await tester.tapByKey('-');
    expect(find.numberToAddText(), '0');

    expect(find.displayText(), '[ 11 ]');
  });

  testWidgets('Multiply should multiply two numbers', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.displayText(), '[  ]');

    await tester.tapByKey('1');
    await tester.tapByKey('3');
    await tester.tapByKey('Enter');
    expect(find.numberToAddText(), '0');

    await tester.tapByKey('2');
    await tester.tapByKey('x');
    expect(find.numberToAddText(), '0');

    expect(find.displayText(), '[ 26 ]');
  });

  testWidgets('Divide should divide two numbers', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.displayText(), '[  ]');

    await tester.tapByKey('1');
    await tester.tapByKey('3');
    await tester.tapByKey('Enter');
    expect(find.numberToAddText(), '0');

    await tester.tapByKey('2');
    await tester.tapByKey('÷');
    expect(find.numberToAddText(), '0');

    expect(find.displayText(), '[ 6.5 ]');
  });

  testWidgets('Square root should return the square root of a number', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.displayText(), '[  ]');

    await tester.tapByKey('4');
    await tester.tapByKey('Enter');
    await tester.tapByKey('√');

    expect(find.displayText(), '[ 2.0 ]');
  });

  testWidgets('Square should return the square of a number', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.displayText(), '[  ]');

    await tester.tapByKey('4');
    await tester.tapByKey('Enter');
    await tester.tapByKey('2');
    await tester.tapByKey('xⁿ');

    expect(find.displayText(), '[ 16 ]');
  });

  /* UTILITY OPERATIONS */
  testWidgets('Undo should undo the last operation', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.displayText(), '[  ]');

    await tester.tapByKey('1');
    await tester.tapByKey('3');
    await tester.tapByKey('Enter');
    expect(find.numberToAddText(), '0');

    await tester.tapByKey('2');
    await tester.tapByKey('+');
    await tester.tapByKey('Undo');
    expect(find.numberToAddText(), '0');

    expect(find.displayText(), '[ 13, 2 ]');
  });

  testWidgets('AC should clear everything', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.displayText(), '[  ]');

    await tester.tapByKey('1');
    await tester.tapByKey('3');
    await tester.tapByKey('Enter');
    await tester.tapByKey('2');
    await tester.tapByKey('+');
    await tester.tapByKey('AC');

    expect(find.displayText(), '[  ]');
    expect(find.numberToAddText(), '0');
  });

  testWidgets('Pop should remove the last number from the stack', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.displayText(), '[  ]');

    await tester.tapByKey('1');
    await tester.tapByKey('3');
    await tester.tapByKey('Enter');
    await tester.tapByKey('2');
    await tester.tapByKey('Enter');
    await tester.tapByKey('Pop');

    expect(find.displayText(), '[ 13 ]');
  });

  testWidgets('← should remove the last digit from the number to add', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.displayText(), '[  ]');

    await tester.tapByKey('1');
    await tester.tapByKey('3');
    await tester.tapByKey('←');
    await tester.tapByKey('Enter');

    expect(find.displayText(), '[ 1 ]');
    expect(find.numberToAddText(), '0');
  });

  testWidgets('+/- should change the sign of the number to add', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.displayText(), '[  ]');

    await tester.tapByKey('1');
    await tester.tapByKey('3');
    await tester.tapByKey('+/-');
    expect(find.numberToAddText(), '-13');

    await tester.tapByKey('+/-');
    expect(find.numberToAddText(), '13');
  });

  testWidgets('Enter should add numbers to stack', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.displayText(), '[  ]');

    await tester.tapByKey('1');
    await tester.tapByKey('3');
    await tester.tapByKey('Enter');
    await tester.tapByKey('2');
    await tester.tapByKey('Enter');

    expect(find.displayText(), '[ 13, 2 ]');
  });
}

extension WidgetTesterExtension on WidgetTester {
  Future<void> tapByKey(String key) async {
    await tap(find.byKey(Key(key)));
    await pump();
  }
}

extension FinderExtensions on CommonFinders {
  String? displayText() {
    final text = byKey(const Key("Display")).evaluate().single.widget as Text;
    return text.data;
  }

  String? numberToAddText() {
    final text = byKey(const Key("NumberToAdd")).evaluate().single.widget as Text;
    return text.data;
  }
}