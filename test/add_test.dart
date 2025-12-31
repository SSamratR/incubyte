import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte/extension_add.dart';

void main() {
  test('String addition of an empty string will return 0', () {
    const input = '';
    final result = input.calculate();
    expect(result, 0);
  });
  test('String addition of a value which contains only a number', () {
    const input = '23';
    final result = input.calculate();
    expect(result, 23);
  });

  test(
    'String addition of comma separated numbers should return the sum of all numbers',
    () {
      const input = '4,2,9';
      final result = input.calculate();
      expect(result, 15);
    },
  );

  test(
    'String addition of new line (\n) separated numbers should return the sum of all numbers',
    () {
      const input = '4\n2\n9';
      final result = input.calculate();
      expect(result, 15);
    },
  );

  test(
    "String addition of delimiter (//[delimiter]\n[numbers…]) separated numbers should return the sum of all numbers",
    () {
      const input = '//;\n1;2;3';
      final result = input.calculate();
      expect(result, 6);
    },
  );

  test(
    "String multiplication of delimiter * (//[delimiter]\n[numbers…]) separated numbers should return the product of all numbers",
    () {
      const input = '//*\n1*5*3';
      final result = input.calculate();
      expect(result, 15);
    },
  );

  test(
    "Addition of negative numbers will throw an exception: negative numbers not allowed <negative_number>.",
    () {
      const input1 = '4,-3,9,-1';
      const input2 = '//;\n1;-2;3;-5';
      const input3 = '1\n-4\n3\n-7';
      const input4 = '-2';
      expectNegativeNumbers(
        input1,
        'Exception: negative numbers not allowed -3,-1.',
      );
      expectNegativeNumbers(
        input2,
        'Exception: negative numbers not allowed -2,-5.',
      );
      expectNegativeNumbers(
        input3,
        'Exception: negative numbers not allowed -4,-7.',
      );
      expectNegativeNumbers(
        input4,
        'Exception: negative numbers not allowed -2.',
      );
    },
  );
}

void expectNegativeNumbers(String input, String errorMessage) {
  expect(
    () => input.calculate(),
    throwsA(predicate((e) => e is Exception && e.toString() == errorMessage)),
  );
}
