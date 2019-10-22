import 'package:flutter/material.dart';
import 'package:swipe_my_ride_final/record.dart';
import 'package:swipe_my_ride_final/garageApp.dart';

void main() => runApp(SwipeMyRideMain());

class ScreenTapWidgetState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Dialog moreDetails = Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  12.0)), //this line changes the shape of the alert box
          child: Container(
            height: 600.0,
            width: 400.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                      'Skyline 370GT 2010 for sale.'
                      '\nCar is in excellent condition.'
                      '\nA couple of modifications added to it for extra sexyness.'
                      '\n\nModifications include:'
                      '\n\nIPL body kit'
                      '\nSntillen Intakes'
                      '\nFront grille plastidipped'
                      '\nSlammed BGW APEX wheels, machined face, gloss black, 15x6.5 x4'
                      '\nToyo Proxes Sport 225/45/15/94/R tyres x4'
                      '\nIPL side skirts'
                      '\nFALKEN car vinyl'
                      '\nVortech V3 centrifugal supercharger'
                      '\nHKS Hi-power exhaust system Twin 120mm 304 stainless steel'
                      '\nAluminium Tower Strut bar'
                      '\n\nPrice is O.N.O'
                      '\nPlease contact me on: 0220325565'
                      '\n\nGod loves you.',
                      softWrap: true),
                ),
                Padding(padding: EdgeInsets.only(top: 50.0)),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: IconButton(
                      icon: Icon(Icons.thumb_up),
                    ))
              ],
            ),
          ),
        );
        showDialog(
            context: context, builder: (BuildContext context) => moreDetails);
      },
      child: Container(
        child: Image.asset('images/skyline.jpeg'),
      ),
    );
  }
}

//class

//This class contains multiple widget that interacts with one another.
class SwipeMyRideMain extends StatelessWidget {
  //The first widget, carTitle, provides information about the vehicle such as model, year, location, and price.
  Widget carTitle = Container(
    padding: const EdgeInsets.only(top: 5, left: 32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                child: Text(
                  'Skyline 370GT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Text(
                'Auckland',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 32),
          child: Text(
            '\$37,000',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    //This returns the title of the App and the content of the scaffold (within Home())
    return MaterialApp(
        title: 'Swipe My Ride',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Home());
  }
}

class Home extends StatelessWidget {
  final Color color1 = Colors.red;
  final Color color2 = Colors.black;

  @override
  Widget build(BuildContext context) {
    Widget buttonSection = Container(
        padding: const EdgeInsets.only(top: 80),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _buildButtonColumn(color2, Icons.close),
          _buildButtonColumn(color1, Icons.whatshot),
        ]));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Swipe My Ride'),
        leading: InkWell(
          child: Icon(Icons.settings),
          onTap: () {
            Navigator.push(
              context, new MaterialPageRoute(builder: (context) => GarageApp()),
            );
          },
        ),
      ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.time_to_leave),
//            onPressed: () {
//              Navigator.push(
//                context,
//                new MaterialPageRoute(builder: (context) => GarageApp()),
//              );
//            },
//          )
//      ]),
      body: Column(children: [
        ScreenTapWidgetState(),
        SwipeMyRideMain().carTitle,
        buttonSection,
      ]),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(icon, color: color, size: 60),
        ]);
  }
}
