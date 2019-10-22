import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:validators/validators.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PrefService.init(prefix: 'pref_');

  PrefService.setDefaultValues({' ': ' '});

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) =>
            new ThemeData(brightness: brightness, accentColor: Colors.green),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Preferences',
            theme: theme,
            home: new MyHomePage(title: 'Preferences'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            )),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 25),
            child: Icon(Icons.account_circle),
          )
        ],
        title: Text(widget.title),
      ),
      body: PreferencePage([
        PreferenceTitle('Search'),
        TextFieldPreference(
          'Enter a car name',
          'user_display_name',
        ),
        TextFieldPreference(
          'Car Model',
          ' ',
          defaultVal: ' ',
          validator: EmailFieldValidator.validate,
        ),
        PreferenceTitle('Select'),
        DropdownPreference(
          'Car type',
          'Car_type',
          defaultVal: 'Car',
          values: ['Car', 'Timeline', 'Truck'],
        ),
        PreferenceTitle('Transmission'),
        RadioPreference(
          'Automatic',
          'auto',
          'ui_theme',
          isDefault: true,
          onSelect: () {},
        ),
        RadioPreference(
          'Manual',
          'manual',
          'ui_theme',
          onSelect: () {},
        ),
        PreferenceTitle('Fuel'),
        PreferenceDialogLink(
          'Fuel Types',
          dialog: PreferenceDialog(
            [
              CheckboxPreference('91', 'content_show_text'),
              CheckboxPreference('95', 'content_show_image'),
              CheckboxPreference('Diesel', 'content_show_audio')
            ],
            title: 'Select fuel types',
            cancelText: 'Cancel',
            submitText: 'Save',
            onlySaveOnSubmit: true,
          ),
        ),
        PreferenceTitle('Other Preferences'),
        PreferenceDialogLink(
          'Price Range',
          dialog: PreferenceDialog(
            [
              RadioPreference(
                  '0 - 2000', 'select_1', 'android_listpref_selected'),
              RadioPreference(
                  '2000 - 10,000', 'select_2', 'android_listpref_selected'),
              RadioPreference(
                  '10,000+', 'select_3', 'android_listpref_selected'),
            ],
            title: 'Select an option',
            cancelText: 'Cancel',
            submitText: 'Save',
            onlySaveOnSubmit: true,
          ),
        ),
        PreferenceDialogLink(
          'Car Year',
          dialog: PreferenceDialog(
            [
              RadioPreference(
                  '1950 - 1970', 'select_1', 'android_listpref_auto_selected'),
              RadioPreference(
                  '1971 - 2000', 'select_2', 'android_listpref_auto_selected'),
              RadioPreference(
                  '2000+', 'select_3', 'android_listpref_auto_selected'),
            ],
            title: 'Select an option',
            cancelText: 'Close',
          ),
        ),
      ]),
    );
  }
}

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please enter an email address!' : null;
  }
}
