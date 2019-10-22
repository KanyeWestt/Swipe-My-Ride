import 'package:flutter/material.dart';
import 'package:swipe_my_ride/uploadForm.dart';

void main() => runApp(UploadCarButton());

class UploadCarButton extends StatelessWidget {
//  final User user;

//  UploadCarButton(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
      child: Text('Upload Car'),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UploadForm()));
      },
      color: Colors.cyan,
    ));
  }
}
