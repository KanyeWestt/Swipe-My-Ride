import 'package:flutter/material.dart';
import 'package:signin/login_page.dart';

void main() => runApp(SignIn());


class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sign In'),
    );
  }
}





  
  

