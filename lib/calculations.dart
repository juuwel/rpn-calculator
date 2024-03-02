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

abstract class UtilityCommand extends Command {
  @override
  void apply(List<num> stack) {
    execute(stack);
  }

  @override
  void unapply(List<num> stack) {
    // This command is not undoable
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

/* UTILITY COMMANDS */
class ClearCommand extends UtilityCommand {
  @override
  void execute(List<num> stack) {
    stack.clear();
  }
}

class BackspaceCommand extends UtilityCommand {
  @override
  void execute(List<num> stack) {
    if (stack.isEmpty) return;
    stack.removeLast();
  }
}

class EnterCommand extends UtilityCommand {
  @override
  void execute(List<num> stack) {}
}
