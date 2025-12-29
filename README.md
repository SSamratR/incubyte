# String Calculator - Incubyte

A Flutter implementation of a String Calculator with TDD approach.

## Overview

This project implements a String Calculator as a Dart extension method that adds functionality to parse and sum numbers from strings with various delimiters.

## Features

The `add()` extension method on `String` supports:

1. **Empty String**: Returns `0` for an empty string
2. **Single Number**: Returns the number itself (e.g., `"23"` returns `23`)
3. **Comma-Separated Numbers**: Sums comma-separated values (e.g., `"4,2,9"` returns `15`)
4. **Newline-Separated Numbers**: Sums newline-separated values (e.g., `"4\n2\n9"` returns `15`)
5. **Custom Delimiters**: Supports custom delimiter syntax `//[delimiter]\n[numbers...]` (e.g., `"//;\n1;2;3"` returns `6`)
6. **Negative Number Validation**: Throws an exception listing all negative numbers found

## Usage

```dart
import 'package:incubyte/extension_add.dart';

void main() {
  // Empty string
  print(''.add()); // 0
  
  // Single number
  print('23'.add()); // 23
  
  // Comma-separated
  print('4,2,9'.add()); // 15
  
  // Newline-separated
  print('4\n2\n9'.add()); // 15
  
  // Custom delimiter
  print('//;\n1;2;3'.add()); // 6
  
  // Negative numbers (throws exception)
  try {
    print('4,-3,9,-1'.add());
  } catch (e) {
    print(e); // Exception: negative numbers not allowed -3,-1.
  }
}
```

## Negative Number Handling

When negative numbers are provided, the calculator throws an exception with the format:
```
Exception: negative numbers not allowed <negative_number1>,<negative_number2>,...
```

Examples:
- `"4,-3,9,-1"` → `Exception: negative numbers not allowed -3,-1.`
- `"//;\n1;-2;3;-5"` → `Exception: negative numbers not allowed -2,-5.`
- `"-2"` → `Exception: negative numbers not allowed -2.`

## Interactive Testing Screen

The app includes a user-friendly interactive screen for testing the String Calculator functionality:

### Running the App

Launch the Flutter application:

```bash
flutter run
```

### Screen Features

- **Multi-line Text Input**: Enter strings with various delimiters
- **Add Button**: Calculate the sum of numbers in the input string
- **Clear Button**: Reset input and results
- **Result Display**: Green card showing successful calculation results
- **Error Display**: Red card showing exception messages (e.g., negative numbers)
- **Examples Section**: Quick reference for all supported formats

### How to Use

1. Enter a string in the text field (e.g., `1,2,3` or `//;\n1;2;3`)
2. Press the **Add** button to calculate the sum
3. View the result in the green result card or error in the red error card
4. Press **Clear** to reset and try a different input

The interactive screen demonstrates all functionality tested in [test/add_test.dart](test/add_test.dart), including:
- Empty strings
- Single numbers
- Comma and newline separators
- Custom delimiters
- Negative number validation

## Running Tests

Run the test suite with:

```bash
flutter test
```

The tests are located in [test/add_test.dart](test/add_test.dart) and cover all features including edge cases and negative number validation.

## Project Structure

- `lib/extension_add.dart` - Implementation of the String Calculator extension
- `lib/main.dart` - Flutter application with interactive testing screen
- `test/add_test.dart` - Comprehensive test suite
