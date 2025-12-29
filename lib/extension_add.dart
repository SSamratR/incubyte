extension StringCalculatorExtension on String {
  int add() {
    if (isEmpty) {
      return 0;
    } else if (int.tryParse(this) != null) {
      return int.parse(this);
    } else if (contains(',') && split(',').isNotEmpty) {
      final numbers = split(',').map((e) => int.parse(e)).toList();
      return numbers.reduce((a, b) => a + b);
    } else if (startsWith('//')) {
      return delimiterAdd();
    } else if (contains('\n') && split('\n').isNotEmpty) {
      final numbers = split('\n').map((e) => int.parse(e)).toList();
      return numbers.reduce((a, b) => a + b);
    }

    return length;
  }

  int delimiterAdd() {
    final delimiterEndIndex = indexOf('\n');
    final delimiter = substring(2, delimiterEndIndex);
    final numbersPart = substring(delimiterEndIndex + 1);
    final numbers = numbersPart
        .split(delimiter)
        .map((e) => int.parse(e))
        .toList();
    return numbers.reduce((a, b) => a + b);
  }
}
