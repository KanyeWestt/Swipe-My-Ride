import 'package:flutter/material.dart';
import 'package:signin/social_media_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signin/login_page.dart';


class NewUser extends StatefulWidget{
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser>{
  final formKey = GlobalKey<FormState>();
  String _email, _password;
  final FirebaseAuth mAuth = FirebaseAuth.instance;


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "New User",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.deepPurple, Colors.blueAccent]),
        ),
        child: Center(
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50),
                  //Logo for SMR
                  Container(
                    constraints: BoxConstraints.expand(
                      height: 150.0,
                    ),
                    child: Image.asset("assets/images/SMRT.png",
                        fit: BoxFit.cover),
                  ),

                  SizedBox(height: 50),

                  Container(
                    width: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Form
                          Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email),
                                      border: OutlineInputBorder(),
                                      hintText: 'Email'),
                                  validator: (input) => !input.contains('@')
                                      ? 'Not a valid Email'
                                      : null,
                                  onSaved: (input) => _email = input.trim(),
                                ),

                                SizedBox(height: 20),
                                //Password
                                TextFormField(
                                  obscureText: true,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      prefixIcon: Icon(Icons.lock),
                                      border: OutlineInputBorder(),
                                      hintText: 'Password'),
                                  validator: (input) => input.length < 8
                                      ? 'You need at least 8 characters'
                                      : null,
                                  onSaved: (input) => _password = input,
                                ),

                                SizedBox(height: 20),

                                ButtonTheme(
                                  minWidth: 300,
                                  height: 50,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    onPressed: signUpWithEmailPassword,
                                    textColor: Colors.white,
                                    padding:
                                        EdgeInsets.fromLTRB(100, 0, 100, 0),
                                    color: Colors.blue,
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20), 
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  void signUpWithEmailPassword() async {
    FirebaseUser user;

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print(_email);
      print(_password);
      try {
        user = (await mAuth.createUserWithEmailAndPassword(
            email: _email, password: _password)).user;
            Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => new MyHomePage()
      ));
      //this.dispose();
      } catch (e) {
        print(e);
        showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text(
                'Error Message',
                style: TextStyle(color: Colors.purple),
              ),
              content: Text('The email is already in use. Please use another email.'),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Dismiss',
                    style: TextStyle(color: Colors.purple),
                    ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
        );
      }
    }
  }
  
}