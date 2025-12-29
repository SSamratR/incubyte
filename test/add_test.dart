import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte/extension_add.dart';

void main() {
  setUp(() {
    // Code to run before each test
  });

  tearDown(() {
    // Code to run after each test
  });

  test('String addition of an empty string will return 0', () {
    const input = '';
    final result = input.add();
    expect(result, 0);
  });
  test('String addition of a value which contains only a number', () {
    const input = '23';
    final result = input.add();
    expect(result, 23);
  });
}
