abstract class Command {
  final executedCommands = [];

  void apply(List<num> stack) {
    if (stack.length < 2) {
      throw Exception('Not enough operands');
    }
    executedCommands.add(stack);
    execute(stack);
  }

  void execute(List<num> stack);

  void unapply(List<num> stack);
}

abstract class UtilityCommand extends Command {
  @override
  void apply(List<num> stack) {
    executedCommands.add(stack);
    execute(stack);
  }
}

/* MATH COMMANDS */
class AddCommand extends Command {
  @override
  void execute(List<num> stack) {
    stack.add(stack.removeLast() + stack.removeLast());
  }

  @override
  void unapply(List<num> stack) {
    // TODO: implement unapply
  }
}

class SubtractCommand extends Command {
  @override
  void execute(List<num> stack) {
    // calling removeLast() twice will get the numbers in the wrong order,
    // as we need to substract the last number from the second to last number
    var last = stack.removeLast();
    stack.add(stack.removeLast() - last);
  }

  @override
  void unapply(List<num> stack) {
    // TODO: implement unapply
  }
}

class MultiplicationCommand extends Command {
  @override
  void execute(List<num> stack) {
    stack.add(stack.removeLast() * stack.removeLast());
  }

  @override
  void unapply(List<num> stack) {
    // TODO: implement unapply
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

  @override
  void unapply(List<num> stack) {
    // TODO: implement unapply
  }
}

class ToPowerCommand extends Command {
  @override
  void execute(List<num> stack) {
    var toPower = stack.removeLast();
    var number = stack.removeLast();
    var result = number;

    for (var i = 1; i < toPower; i++) {
      result *= number;
    }
    stack.add(result);
  }

  @override
  void unapply(List<num> stack) {
    // TODO: implement unapply
  }
}

/* UTILITY COMMANDS */
class ClearCommand extends UtilityCommand {
  @override
  void execute(List<num> stack) {
    stack.clear();
  }

  @override
  void unapply(List<num> stack) {
    // TODO: implement unapply
  }
}

class BackspaceCommand extends UtilityCommand {
  @override
  void execute(List<num> stack) {
    if (stack.isEmpty) return;
    stack.removeLast();
  }

  @override
  void unapply(List<num> stack) {
    // TODO: implement unapply
  }
}

class EnterCommand extends UtilityCommand {
  @override
  void execute(List<num> stack) {

  }

  @override
  void unapply(List<num> stack) { }
}
