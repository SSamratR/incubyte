extension StringCalculatorExtension on String {
  int add() {
    if (isEmpty) {
      return 0;
    } else if (int.tryParse(this) != null) {
      return int.parse(this);
    }
    return length;
  }
}
