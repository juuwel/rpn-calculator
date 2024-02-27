void main() {
  print('Hello, World!');

  final addCommand = AddCommand();
}

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

class SubstractCommand extends Command {
  @override
  void execute(List<num> stack) {
    stack.add(stack.removeLast() - stack.removeLast());
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
    stack.last == 0
        ? throw Exception('Cannot divide by zero')
        : stack.add(stack.removeLast() / stack.removeLast());
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

    for (var i = 0; i < toPower; i++) {
      number *= number;
    }
    stack.add(number);
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
