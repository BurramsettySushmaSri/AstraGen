// ignore_for_file: use_key_in_widget_constructors

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation/components/MyHomePage.dart';
import 'model.dart';
import 'MyHomePage.dart';

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
  final TextEditingController _name = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _add = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                  hintText: 'Enter your name',
                  labelText: 'Name',
                  icon: const Icon(Icons.person),
                  suffixIcon: IconButton(
                    onPressed: _name.clear,
                    icon: const Icon(Icons.clear),
                  )),
              validator: (value) {
                if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value) || value.length < 3) {
                  //allow upper and lower case alphabets and space
                  return "Enter Correct Name";
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: _phone,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Enter a phone number',
                labelText: 'Phone',
              ),
              maxLength: 10,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
            ),
            TextFormField(
              controller: _dob,
              decoration: InputDecoration(
                  hintText: 'Enter your date of birth', labelText: 'Dob', prefixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_today))),
            ),
            TextFormField(
              controller: _add,
              decoration: const InputDecoration(
                icon: Icon(Icons.home),
                hintText: 'Enter your address',
                labelText: 'address',
              ),
            ),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  //check if form data are valid,
                  // your process task ahed if all data are valid
                }
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff03dac6), // background
                onPrimary: Colors.white, // foreground
              ),
              child: const Text('validate'),
            ),

            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 850.0, top: 40.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context, WelcomePage(name: _name.text, phone: _phone.text, dob: _dob.text, add: _add.text));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff03dac6), // background
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
      ),
    );
  }
}
