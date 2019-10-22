// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:swipe_my_ride/email.dart';
import 'package: validator.dart';

void main() {
  test('Email is empty test', () {

    var result = FieldValidator.validateEmail('');
    expect(result, 'Please enter your email!');

  });

  test('Email is invalid test', () {

    var result = FieldValidator.validateEmail('daniel.gmail.com');
    expect(result, 'Please enter a valid email!');

  });

  test('Email is invalid test', () {

    var result = FieldValidator.validateEmail('mafileo.daniel93@gmail.com');
    expect(result, null);

  });

  test('Password is empty test', (){

    var result = FieldValidator.validatePassword('');
    expect(result, 'Please enter password!');

  });

  test('Password is less than 8 characters test', (){

    var result = FieldValidator.validatePassword('1234567');
    expect(result, 'Password must be aleast 8 characters');

  });

  test('Password is valid test', (){

    var result = FieldValidator.validatePassword('swipmyride1234567');
    expect(result, null);

  });
}