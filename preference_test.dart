import 'package:flutter_test/flutter_test.dart';
import 'package:preferences_example/main.dart';


void main() {
  //Testing email field:
  test('empty email field returns error string', () {
    var result = EmailFieldValidator.validate('');
    expect(result, 'Please enter an email address!');
  });

  test('non-empty email returns null', () {
    var result = EmailFieldValidator.validate('email');
    expect(result, null);
  });
}
