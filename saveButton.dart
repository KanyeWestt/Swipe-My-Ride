import 'package:flutter/material.dart';
import 'package:swipe_my_ride/record.dart';
import 'user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SaveButton extends StatelessWidget {
  final Record record;
  final User user;

  SaveButton(this.record, this.user);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: alreadySaved(user.name, record.getDocID()),
        builder: (context, AsyncSnapshot<bool> result) {
          if (!result.hasData)
            return Container(
              child: IconButton(icon: Icon(Icons.favorite), color: Colors.red),
            );
          else
            return Container(
                child: IconButton(
                    icon: Icon(Icons.favorite_border),
                    color: Colors.red,
                    onPressed: () {
//                      this.user.updateDB(this.record.getDocID());
                      Icon(Icons.favorite);
                    }));
        });
  }

  Future<bool> alreadySaved(String name, String documentID) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('users')
        .where('name', isEqualTo: name)
        .getDocuments();

    return result.documents.contains(documentID);
  }
}
