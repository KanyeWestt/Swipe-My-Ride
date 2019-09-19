import 'package:flutter/material.dart';
import 'package:swipe_my_ride/record.dart';

class SaveButton extends StatelessWidget{
  final Record record;
  final User user;
  SaveButton(this.record, this.user)
  {
//    this.record.description
  }

  @override
  Widget build(BuildContext context){
    Scaffold(

    );
  }



}

//Dummy user class for when creating a save button
class User{
  final String name;
  final String age;
  User (this.name, this.age);
}