import 'package:flutter/material.dart';
import 'imageUploader.dart';

void main() => runApp(UploadForm());

class UploadForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Car Details';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  var values = new Map();

  MyCustomFormState() {
    this.values[String] = String;
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
        color: Colors.grey.shade300,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //for inputting the car's make
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Please enter a make:',
                  icon: Icon(Icons.add_circle_outline),
                  fillColor: Colors.white,
                ),
                validator: MakeFieldValidator.validate,
                onSaved: (value) {
                  values['make'] = value;
                },
              ),
              SizedBox(height: 25),
              //for inputting the car's model
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Please enter a model:',
                  icon: Icon(Icons.add_circle_outline),
                  fillColor: Colors.white,
                ),
                validator: ModelFieldValidator.validate,
                onSaved: (value) {
                  values['model'] = value;
                },
              ),
              SizedBox(height: 25),
              //for inputting the car's year
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Please enter a year:',
                  icon: Icon(Icons.add_circle_outline),
                  fillColor: Colors.white,
                ),
                validator: YearFieldValidator.validate,
                onSaved: (value) {
                  values['year'] = value;
                },
              ),
              SizedBox(height: 25),
              //for inputting the car's location
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Please enter vehicle's location:",
                  icon: Icon(Icons.add_circle_outline),
                  fillColor: Colors.white,
                ),
                validator: LocationFieldValidator.validate,
                onSaved: (value) {
                  values['location'] = value;
                },
              ),
              SizedBox(height: 25),
              //for inputting the car's mileage
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Please enter vehicle's mileage:",
                  icon: Icon(Icons.add_circle_outline),
                  fillColor: Colors.white,
                ),
                validator: MileageFieldValidator.validate,
                onSaved: (value) {
                  values['mileage'] = value;
                },
              ),
              SizedBox(height: 25),
              //for inputting the car's price
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Please enter an asking price:',
                  icon: Icon(Icons.add_circle_outline),
                  fillColor: Colors.white,
                ),
                validator: PriceFieldValidator.validate,
                onSaved: (value) {
                  values['price'] = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  color: Colors.lightBlueAccent,
                  onPressed: () async {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a Snackbar.
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                      await new Future.delayed(const Duration(seconds: 2));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageUploader()));
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        )));
  }
}

class MakeFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please enter a make:' : null;
  }
}

class ModelFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please enter a model:' : null;
  }
}

class YearFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please enter a year:' : null;
  }
}

class LocationFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? "Please enter vehicle's location:" : null;
  }
}

class MileageFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? "Please enter vehicle's mileage:" : null;
  }
}

class PriceFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Please enter an asking price:' : null;
  }
}
