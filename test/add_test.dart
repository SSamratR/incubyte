import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte/extension_add.dart';

void main() {
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

  test(
    'String addition of comma separated numbers should return the sum of all numbers',
    () {
      const input = '4,2,9';
      final result = input.add();
      expect(result, 15);
    },
  );

  test(
    'String addition of new line (\n) separated numbers should return the sum of all numbers',
    () {
      const input = '4\n2\n9';
      final result = input.add();
      expect(result, 15);
    },
  );

  test(
    "String addition of delimiter (//[delimiter]\n[numbers…]) separated numbers should return the sum of all numbers",
    () {
      const input = '//;\n1;2;3';
      final result = input.add();
      expect(result, 6);
    },
  );

  test(
    "Addition of negative numbers will throw an exception: negative numbers not allowed <negative_number>.",
    () {
      const input = '4,-2,9,-5';
      expect(
        () => input.add(),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString() ==
                    'Exception: negative numbers not allowed -2,-5.',
          ),
        ),
      );
    },
  );
}
