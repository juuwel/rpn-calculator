abstract class Command {
  List<num> _lastTwoNumbers = [];

  void apply(List<num> stack) {
    if (stack.length < 2) {
      throw Exception('Not enough operands');
    }
    _lastTwoNumbers = (stack.sublist(stack.length - 2));
    execute(stack);
  }

  void execute(List<num> stack);

  void unapply(List<num> stack) {
    stack.removeLast();
    stack.addAll(_lastTwoNumbers);
  }
}

/* MATH COMMANDS */
class AddCommand extends Command {
  @override
  void execute(List<num> stack) {
    stack.add(stack.removeLast() + stack.removeLast());
  }
}

class SubtractCommand extends Command {
  @override
  void execute(List<num> stack) {
    // calling removeLast() twice will get the numbers in the wrong order,
    // as we need to subtract the last number from the second to last number
    var last = stack.removeLast();
    stack.add(stack.removeLast() - last);
  }
}

class MultiplicationCommand extends Command {
  @override
  void execute(List<num> stack) {
    stack.add(stack.removeLast() * stack.removeLast());
  }
}

class DivisionCommand extends Command {
  @override
  void execute(List<num> stack) {
    if (stack.last == 0) {
      throw Exception('Cannot divide by zero');
    }
    var last = stack.removeLast();
    stack.add(stack.removeLast() / last);
  }
}

class ToPowerCommand extends Command {
  @override
  void execute(List<num> stack) {
    var toPower = stack.removeLast();
    var number = stack.removeLast();
    bool isNegative = toPower < 0;
    var result = number;

    if (toPower == 0) {
      result = 1;
    } else if (toPower == 1) {
      result = number;
    } else {
      if (isNegative) {
        toPower = -toPower;
      }

      for (var i = 1; i < toPower; i++) {
        result *= number;
      }

      if (isNegative) {
        result = 1 / result;
      }
    }
    stack.add(result);
  }
}

class SquareRootCommand extends Command {
  @override void apply(List<num> stack) {
    if (stack.isEmpty) {
      throw Exception('Not enough operands');
    }
    var number = stack.removeLast();
    if (number < 0) {
      throw Exception('Cannot calculate square root of a negative number');
    }
    stack.add(number);
    execute(stack);
  }

  @override
  void execute(List<num> stack) {
    var number = stack.removeLast();
    double guess = number / 2.0;
    double precision = 0.00001; // You can adjust this value for more or less precision

    while ((guess * guess - number).abs() > precision) {
      guess = (guess + (number / guess)) / 2;
    }

    stack.add(guess);
  }
}


