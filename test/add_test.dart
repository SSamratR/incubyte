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
    String input = '';
    int result = input.add();
    expect(result, 0);
  });
}
