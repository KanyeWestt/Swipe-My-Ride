import 'package:flutter/material.dart';

main(){

    runApp(DropDown());
}

class DropDown extends StatefulWidget {
  DropDown() : super();

  final String title = "DropDown Demo";

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
  //
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
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Preferences"),
      ),
        body: new Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                SizedBox(height: MediaQuery.of(context).size.height * 0.35),

                Text(" "),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButton(
                  value: _selectedPreference,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
                SizedBox(
                  height: 100.0,
                ),
                Text('Selected: ${_selectedPreference.name}'),
                // [Monday] checkbox
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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

                // [Tuesday] checkbox
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Manual"),
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

                // [Wednesday] checkbox
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Triptonic"),
                    Checkbox(
                      value: pref3,
                      onChanged: (bool value) {
                        setState(() {
                          pref3 = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
