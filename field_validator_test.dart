import 'package:flutter_test/flutter_test.dart';
import 'package:swipe_my_ride/uploadForm.dart';

void main(){

  //Testing 'make' field
  test('empty make field returns error string', (){
    var result = MakeFieldValidator.validate('');
    expect(result, 'Please enter a make:');
  });

  test('non-empty make returns null', (){
    var result = MakeFieldValidator.validate('make');
    expect(result, null);
  });


  //Testing 'model' field
  test('empty model field returns error string', (){
    var result = ModelFieldValidator.validate('');
    expect(result, 'Please enter a model:');
  });

  test('non-empty model returns null', (){
    var result = ModelFieldValidator.validate('model');
    expect(result, null);
  });


  //Testing 'year' field
  test('empty year field returns error string', (){
    var result = YearFieldValidator.validate('');
    expect(result, 'Please enter a year:');
  });

  test('non-empty year returns null', (){
    var result = YearFieldValidator.validate('1992');
    expect(result, null);
  });


  //Testing 'location' field
  test('empty location field returns error string', (){
    var result = LocationFieldValidator.validate('');
    expect(result, "Please enter vehicle's location:");
  });

  test('non-empty location returns null', (){
    var result = LocationFieldValidator.validate('location');
    expect(result, null);
  });


  //Testing 'price' field
  test('empty price field returns error string', (){
    var result = PriceFieldValidator.validate('');
    expect(result, 'Please enter an asking price:');
  });

  test('non-empty price returns null', (){
    var result = PriceFieldValidator.validate('2000');
    expect(result, null);
  });


  //Testing 'mileage' field
  test('empty mileage field returns error string', (){
    var result = MileageFieldValidator.validate('');
    expect(result, "Please enter vehicle's mileage:");
  });

  test('non-empty mileage returns null', (){
    var result = MileageFieldValidator.validate('100000');
    expect(result, null);
  });
}