// ignore_for_file: use_key_in_widget_constructors, dead_code

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model.dart';
import 'package:navigation/util/constants.dart';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  final WelcomePage? recievedata;
  const MyCustomForm({Key? key, this.recievedata}) : super(key: key);

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
  void initState() {
    if (widget.recievedata != null) {
      _name = TextEditingController(text: widget.recievedata?.name);
      _dob = TextEditingController(text: widget.recievedata?.dob);
      _phone = TextEditingController(text: widget.recievedata?.phone);
      _add = TextEditingController(text: widget.recievedata?.add);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Enter User Details'),
          backgroundColor: Color.fromARGB(255, 45, 54, 102),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: constants.sizeboxheight,
                    ),
                    (MediaQuery.of(context).size.width < 600)
                        ? Column(children: [
                            nameCard(context),
                            phoneCard(context),
                            dobCard(context),
                            addCard(context),
                          ])
                        : Column(children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  nameCard(context),
                                  phoneCard(context),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  dobCard(context),
                                  addCard(context),
                                ])
                          ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(top: constants.form_pa_top),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pop(
                                    context,
                                    WelcomePage(
                                        name: _name.text,
                                        phone: _phone.text,
                                        dob: _dob.text,
                                        add: _add.text));
                              }

                              _formKey.currentState!.save();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(
                                  255, 45, 54, 102), // background
                              onPrimary: Colors.white, // foreground
                            ),
                            child: const Text('Submit'),
                          ),
                        )
                      ],
                    ),
                  ],
                ))));
  }

  Widget nameCard(BuildContext context) {
    return Card(
      child: SizedBox(
        width: widthc(context),
        child: TextFormField(
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
            if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
              return "Enter Correct Name";
            } else if (value.length < constants.namelen) {
              //allow upper and lower case alphabets and space
              return "Enter atleast three alphabets.";
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  Widget phoneCard(BuildContext context) {
    return Card(
      child: SizedBox(
        width: widthc(context),
        child: TextFormField(
          controller: _phone,
          decoration: const InputDecoration(
            icon: Icon(Icons.phone),
            hintText: 'Enter a phone number',
            labelText: 'Phone',
          ),
          maxLength: constants.maxlenphone,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          validator: (value) {
            if (value!.isEmpty || value.length != 10) {
              return 'Enter correct phone number';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  Widget dobCard(BuildContext context) {
    return Card(
      child: SizedBox(
        width: widthc(context),
        child: TextFormField(
          controller: _dob,
          decoration: InputDecoration(
              hintText: 'Enter your date of birth',
              labelText: 'Dob',
              prefixIcon: IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2050));
                    if (pickedDate != null) {
                      DateTime formattedDate = pickedDate;

                      _dob.text =
                          "${formattedDate.day}-${formattedDate.month}-${formattedDate.year}";
                    }
                  },
                  icon: const Icon(Icons.calendar_today))),
          validator: (value) {
            if (value!.isEmpty ||
                (!RegExp(r'^[1-9]|2[1-9][-]([1-9]|1[12])[-]\d{4}')
                    .hasMatch(value))) {
              //allow upper and lower case alphabets and space
              return 'Enter correct date';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  Widget addCard(BuildContext context) {
    return Card(
        child: SizedBox(
      width: widthc(context),
      child: TextFormField(
        controller: _add,
        decoration: const InputDecoration(
          icon: Icon(Icons.home),
          hintText: 'Enter your address',
          labelText: 'address',
        ),
      ),
    ));
  }

  widthc(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      width = width;
      return width;
    } else {
      width = width / 3;
      return width;
    }
  }
}
