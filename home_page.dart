import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'chat_interface.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Garage Chat")

      ),
      body: new ChatInterface(),
    );
  }
}