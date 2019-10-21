import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;


class FaceBookLogin extends StatefulWidget{

  FaceBookLogin(){
    createState();
  }
  
  @override
  _FacebookState createState() => new _FacebookState();

 
}

class _FacebookState extends State<FaceBookLogin>{

  bool _isLoggedIn = true;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  void loginWithFB() async{
    var result = await facebookLogin.logInWithReadPermissions(['email']);


    

    switch(result.status){

      case FacebookLoginStatus.error:
        setState(() {
           _isLoggedIn = false;
           
            print("errrrrorrrrrr");
        }); 
        break;
      
      
      case FacebookLoginStatus.cancelledByUser:
        setState(() {
           _isLoggedIn = false;
           
            print("cannncceelled");
        }); 
        break;

        case FacebookLoginStatus.loggedIn:
      print("LLOOOOGGGEDIINNN");
        final token = result.accessToken.token;
        final graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token'
          );
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
          print("RUNNNINNNGGG");
          
        });
        break;

      
    }

  }

  _logout(){
    facebookLogin.logOut();
    setState(() {
     _isLoggedIn = false; 
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _isLoggedIn
            ? Container(
                    height: 300,
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        'http://placehold.it/50x50',
                        //userProfile["picture"]["data"]["url"],
                        height: 50.0,
                        width: 50.0,
                      ),
                      //Text(userProfile["name"]),
                      OutlineButton(
                        child: Text("Logout"),
                        onPressed: (){
                          _logout();
                        },
                      ),
                    ],
                  ),
                )
                :
                Center(
                    child: OutlineButton(
                      child: Text("Login with Facebook"),
                      onPressed: () {
                        loginWithFB();
                      },
                    ),
                  )),
      ),
    );
     

        // RaisedButton(
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //   textColor: Colors.white,
        //   padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
        //   color: Colors.blueAccent,
        //   child: const Text(
        //     'facebook'
        //   ),
        //   onPressed: (){
        //     if(_isLoggedIn == false){
        //       _loginWithFB();
        //       // Navigator.of(context).push(MaterialPageRoute(
        //       //   builder: (BuildContext context) => new HomePage()
        //       // ));

        //     }
        
  }
  
}