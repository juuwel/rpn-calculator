# Reverse polish notation calculator made with Flutter

The first compulsory assignment of Mobile Development 2024 at EASV.
The scope of the project is implementing an RPN calculator, and testing it accordingly with both unit and integration tests.

## Operations Supported

The calculator supports the following operations:

1. **Addition (`+`)**: Adds two numbers together.
2. **Subtraction (`-`)**: Subtracts one number from another.
3. **Multiplication (`x`)**: Multiplies two numbers together.
4. **Division (`÷`)**: Divides one number by another.
5. **Exponentiation (`xⁿ`)**: Raises a number to the power of another number.
6. **Square Root (`√`)**: Calculates the square root of a number. This is a `OneOperandCommand` operation.
7. **Factorial**: Calculates the factorial of a number. This is a `OneOperandCommand` operation.
8. **1/x**: Calculates the reciprocal of a number. This is a `OneOperandCommand` operation.

## Utility Operations

The calculator also supports several utility operations:

1. **Enter**: Adds the current number to the stack.
2. **+/-**: Changes the sign of the current number.
3. **AC**: Clears the stack and the current number.
4. **←**: Removes the last digit from the current number.
5. **Pop**: Removes the last number from the stack.
6. **Undo**: Undoes the last operation.
