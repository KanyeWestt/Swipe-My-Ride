import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swipe_my_ride_final/mainScreen.dart';
import 'record.dart';
import 'detailPage.dart';
import 'home_page.dart';

void main() => runApp(GarageApp());

class GarageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Crib',
      home: GaragePage(),
    );
  }
}

class GaragePage extends StatefulWidget {
  @override
  _GaragePageState createState() {
    return _GaragePageState();
  }
}

class _GaragePageState extends State<GaragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => SwipeMyRideMain()),
            );
          },
        )
      ],
        title: Text('Swipe My Ride')),
      body: _buildBody(context),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 570, right: 10),
            child: FloatingActionButton(
              child: Icon(Icons.navigation),
              backgroundColor: Colors.green,
              onPressed: () {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }
              },
            )
        )
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('rides').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
            leading: new Image(
              image: new NetworkImage(record.image),
            ),
            title: Text(record.model + ", " + record.name),
            subtitle: Text(record.toString()),
            trailing: Text(record.price.toString()),
            isThreeLine: true,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailPage(record)));
            }),
      ),
    );
  }
}