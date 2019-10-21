import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget{


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
                padding: const EdgeInsets.only(top: 5, left: 32),
                child: Text(
                  'Skyline 370GT \$37,000',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Auckland',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    Color color1 = Colors.red;
    Color color2 = Colors.black;

    Widget buttonSection = Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _buildButtonColumn(color2, Icons.highlight_off),
      _buildButtonColumn(color1, Icons.whatshot),
    ]));

    Widget textSection = Container(
      padding: const EdgeInsets.only(left: 32, bottom: 10),
      child: Text(
        'Skyline 370GT 2010 for sale. \nCar is in excellent condition. \nA couple of modifications added to it for extra sexyness.'
//            'Modifications include:'
//            'IPL body kit'
//            'Stillen Intakes'
//            'Front grille plastidipped'
//            'Slammed BGW APEX wheels, machined face, gloss black, 15x6.5 x4'
//            'Toyo Proxes Sport 225/45/15/94/R tyres x4'
//            'IPL side skirts'
//            'FALKEN car vinyl'
//            'Vortech V3 centrifugal supercharger'
//            'HKS Hi-power exhaust system Twin 120mm 304 stainless steel'
//            'Aluminium Tower Strut bar'
//            'Price is O.N.O'
//            'Please contact me on: 0220325565'
            '\nGod loves you.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Swipe My Ride',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Swipe My Ride'),
        ),
        body: 

        Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.deepPurple, Colors.blueAccent]),
        ),
        child: Column(children: [
          Image.asset(
            'assets/images/skyline.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          carTitle,
          Flexible(
            fit: FlexFit.loose,
            flex: 2,
          child: textSection),
          buttonSection,
        ]),
      ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 60),
          Container(
            margin: const EdgeInsets.only(top: 8),
          ),
        ]);
  }

  
}