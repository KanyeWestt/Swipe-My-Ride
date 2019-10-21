import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home: DropDown(),
));
class DropDown extends StatefulWidget {
  @override
  DropDownState createState() => DropDownState();
}

class Preference {
  int id;
  String name;

  Preference(this.id, this.name);

  static List<Preference> getPreferences() {
    return <Preference>[

      Preference(0, 'Make'),
      Preference(1, 'Mazda'),
      Preference(2, 'Toyota'),
      Preference(3, 'Nissan'),
      Preference(4, 'Holden'),
    ];
  }
}


class DropDownState extends State<DropDown> {


  List<Preference> _preferences = Preference.getPreferences();
  List<DropdownMenuItem<Preference>> _dropdownMenuItems;
  Preference _selectedPreference;

  bool pref1 = false;
  bool pref2 = false;
  bool pref3 = false;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_preferences);
    _selectedPreference = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Preference>> buildDropdownMenuItems(List preferences) {
    List<DropdownMenuItem<Preference>> items = List();
    for (Preference preference in preferences) {
      items.add(
        DropdownMenuItem(
          value: preference,
          child: Text(preference.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Preference selectedPreference) {
    setState(() {
      _selectedPreference = selectedPreference;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.blueGrey,
          leading: Container(

              margin: EdgeInsets.only(left: 15),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,

              )
          ),

          actions: <Widget>[
            Container(



              margin: EdgeInsets.only(right: 25),
              child: Icon(Icons.account_circle),
            )
          ],
          title: new Text("Preferences"),

          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[


              Padding(

                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(
                    child: Text('Clear'),

                  )
              ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Select car preferences"),
      ),

            DropdownButton(
              value: _selectedPreference,
              items: _dropdownMenuItems,
              onChanged: onChangeDropdownItem,
            ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Automatic"),
                  Checkbox(
                    value: pref1,
                    onChanged: (bool value) {
                      setState(() {
                        pref1 = value;
                      });
                    },
                  ),
                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Text("Manual     "),
                  Checkbox(
                    value: pref2,
                    onChanged: (bool value) {
                      setState(() {
                        pref2 = value;
                      });
                    },
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Triptonic   "),
                  Checkbox(
                    value: pref3,
                    onChanged: (bool value) {
                      setState(() {
                        pref3 = value;
                        Column(

                        );
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}