extension StringCalculatorExtension on String {
  int add() {
    if (isEmpty) {
      return 0;
    } else if (int.tryParse(this) != null) {
      return int.parse(this);
    } else if (contains(',') && split(',').isNotEmpty) {
      final numbers = split(',').map((e) => int.parse(e)).toList();
      return numbers.reduce((a, b) => a + b);
    }

    return length;
  }
}
