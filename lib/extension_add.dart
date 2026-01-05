extension StringCalculatorExtension on String {
  int calculate() {
    if (isEmpty) {
      return 0;
    }
    if (int.tryParse(this) != null) {
      checkNegativeNumbers(this, ',');
      return int.parse(this);
    }
    if (startsWith('//')) {
      return calculateWithCustomDelimiter();
    }
    if (contains(',') && split(',').isNotEmpty) {
      checkNegativeNumbers(this, ',');
      final numbers = split(',').map((e) => int.parse(e)).toList();
      return numbers.reduce((a, b) => a + b);
    }
    if (contains('\n') && split('\n').isNotEmpty) {
      checkNegativeNumbers(this, '\n');
      final numbers = split('\n').map((e) => int.parse(e)).toList();
      return numbers.reduce((a, b) => a + b);
    }

    return length;
  }

  int calculateWithCustomDelimiter() {
    final delimiterEndIndex = indexOf('\n');
    final delimiter = substring(2, delimiterEndIndex);
    final numbersPart = substring(delimiterEndIndex + 1);
    final numbers = numbersPart
        .split(delimiter)
        .map((e) => int.parse(e))
        .toList();
    checkNegativeNumbers(numbersPart, delimiter);
    if (delimiter == "*") {
      return numbers.reduce((a, b) => a * b);
    }
    if (delimiter == "o") {
      final oddNumbers = numbers.where((e) => e.isOdd).toList();
      return oddNumbers.reduce((a, b) => a + b);
    }
    return numbers.reduce((a, b) => a + b);
  }

  void checkNegativeNumbers(String input, String delimiter) {
    if (input.contains('-')) {
      throw Exception(
        'negative numbers not allowed ${input.split(delimiter).where((e) => e.startsWith('-')).join(',')}.',
      );
    }
  }
}
