// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'details.dart';
import 'main.dart';

void main() => runApp(MyCustomForm());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     return MaterialApp(

//       home: Scaffold(

//         body: MyCustomForm(),
//       ),
//     );
//   }
// }

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _add = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    int counter = 0;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _name,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name',
            ),
          ),
          TextFormField(
            controller: _phone,
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Phone',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
          ),
          TextFormField(
            controller: _dob,
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
              hintText: 'Enter your date of birth',
              labelText: 'Dob',
            ),
          ),
          TextFormField(
            controller: _add,
            decoration: const InputDecoration(
              icon: Icon(Icons.home),
              hintText: 'Enter your address',
              labelText: 'address',
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 850.0, top: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop(MaterialPageRoute(builder: (context) => WelcomePage(name: _name.text, phone: _phone.text, dob: _dob.text, add: _add.text)));
                      // counter++;
                      // if (counter > 0) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => const SecondRoute()),
                      //   );
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff03dac6), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //     padding: const EdgeInsets.only(left: 150.0, top: 40.0),
          //     child: const ElevatedButton(
          //       child: Text('Submit'),
          //       onPressed: null,
          //     )),
        ],
      ),
    );
  }
}
