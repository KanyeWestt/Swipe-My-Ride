import 'package:flutter/material.dart';
import 'package:swipe_my_ride/uploadForm.dart';

void main() => runApp(UploadCarButton());

class UploadCarButton extends StatelessWidget {
//  final User user;

//  UploadCarButton(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
            icon: Icon(Icons.file_upload),
            color: Colors.blue,
            iconSize: 60,
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => UploadForm()),
              );
//                      this.user.updateDB(this.record.getDocID());
            }));
  }
}
