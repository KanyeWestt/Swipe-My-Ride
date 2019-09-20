import 'package:flutter/material.dart';
import 'record.dart';

class DetailPage extends StatelessWidget {
  final Record record;

  DetailPage(this.record);

  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height * 0.35),
        SizedBox(height: 10.0),
        Text(
          record.model,
          style: TextStyle(color: Colors.black, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      record.name,
                      style: TextStyle(color: Colors.black),
                    ))),
            Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      record.price,
                      style: TextStyle(color: Colors.black),
                    ))),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(record.image),
                fit: BoxFit.fill,
              ),
            )),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        Container(
//          height: MediaQuery.of(context).size.height * 0.75,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,

          child: Center(
            child: topContentText,
          ),
        ),
//        Positioned(
//          left: 8.0,
//          top: MediaQuery.of(context).size.height * 0.35,
//          child:
//        Text(
//          record.model + ", " + record.name,
//          style: TextStyle(color: Colors.black),
//        ),

      ],
    );

    final bottomContentText = Text
      (this.record.description,
      style: TextStyle(fontSize: 18.0),
    );

    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText],
        ),
      ),
    );
    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
