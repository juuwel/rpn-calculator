void main() {
  print('Hello, World!');

  final addCommand = AddCommand();
}

abstract class Command {
  final executedCommands = [];

  void apply(List<num> stack);
  void unapply(List<num> stack);
}

class AddCommand extends Command {
  @override
  void apply(List<num> stack) {
    stack.add(stack.removeLast() + stack.removeLast());
    print(stack);
  }

  @override
  void unapply(List<num> stack) {
    // TODO: implement unapply
  }
}

class SubstractCommand extends Command {
  @override
  void apply(List<num> stack) {
    stack.add(stack.removeLast() - stack.removeLast());
    print(stack);
  }

  @override
  void unapply(List<num> stack) {
    // TODO: implement unapply
  }
}

class MultiplicationCommand extends Command {
  @override
  void apply(List<num> stack) {
    stack.add(stack.removeLast() * stack.removeLast());
  }

  @override
  void unapply(List<num> stack) {
    // TODO: implement unapply
  }
}

class DivisionCommand extends Command {
  @override
  void apply(List<num> stack) {
    stack.last == 0
        ? throw Exception('Cannot divide by zero')
        : stack.add(stack.removeLast() / stack.removeLast());
  }

  @override
  void unapply(List<num> stack) {
    // TODO: implement unapply
  }
}
