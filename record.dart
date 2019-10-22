import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String description;
  final String name;
  final String model;
  final int year;
  final String price;
  final String image;
  final String location;
  final String mileage;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['model'] != null),
        assert(map['year'] != null),
        assert(map['price'] != null),
        assert(map['location'] != null),
        assert(map['mileage'] != null),
        assert(map['image'] != null),
        assert(map['description'] != null),
        name = map['name'],
        model = map['model'],
        year = map['year'],
        price = map['price'],
        location = map['location'],
        mileage = map['mileage'],
        image = map['image'],
        description = map['description'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  String getDocID() {
    return this.reference.documentID;

  }

  @override
  String toString() => "$year\n$location\n$mileage";
}
