// ignore_for_file: use_key_in_widget_constructors, dead_code

import 'dart:core';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model.dart';
import 'package:navigation/util/constants.dart';


// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  final UserData? recievedata;
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
  final scaffoldKey = GlobalKey<ScaffoldState>();

 String _selectedGender = 'male';
  TextEditingController _name = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _add = TextEditingController();
  TextEditingController _time = TextEditingController();

  @override
  void initState() {
    if (widget.recievedata != null) {
      _name = TextEditingController(text: widget.recievedata?.name);
      _dob = TextEditingController(text: widget.recievedata?.dob);
      _phone = TextEditingController(text: widget.recievedata?.phone);
      _add = TextEditingController(text: widget.recievedata?.add);
      _time = TextEditingController(text: widget.recievedata?.time);
      _selectedGender=widget.recievedata?.gender??'male';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Enter User Details'),
          backgroundColor: Color.fromARGB(255, 45, 54, 102),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: constants.sizeboxheight,
                    ),
                    (MediaQuery.of(context).size.width < 600)
                        ? Column(children:  [
                            nameCard(context),
                            phoneCard(context),
                            dobCard(context),
                            addCard(context),
                            timeCard(context),
                            RadioB(context),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: 
                                  techChips(),
                                ),
                            
                          ],)
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
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  timeCard(context),
                                  RadioB(context),
                                ]),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: 
                                  techChips(),
                                ),
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
                                    UserData(
                                        name: _name.text,
                                        phone: _phone.text,
                                        dob: _dob.text,
                                        add: _add.text,
                                         time: _time.text,gender: _selectedGender));
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
              return "Enter correct name ";
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
              Future.delayed(Duration.zero, () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                        SnackBar(content: Text("Enter correct phone number")))
                    .closed
                    .then((reason) {});
              });
              return '';
            }
            return null;
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
              hintText: 'Enter your date of birth',
              labelText: 'Dob',
              icon: Icon(Icons.calendar_today_sharp)),
          onTap: () async {
            DateTime? pickedDate = DateTime(1900);
            FocusScope.of(context).requestFocus(new FocusNode());
            pickedDate = await showDatePicker(
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

  Widget timeCard(BuildContext context) {
    return Card(
        child: SizedBox(
            width: widthc(context),
            child: TextFormField(
                controller: _time,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    hintText: 'Choose Time',
                    labelText: 'Time',
                    icon: Icon(Icons.timelapse_rounded)),
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  final TimeOfDay? timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.dial,
                  );
                  TimeOfDay selectedTime = TimeOfDay.now();

                  if (timeOfDay != null && timeOfDay != selectedTime) {
                    selectedTime = timeOfDay;
                    _time.text =
                        ("${selectedTime.hour}:${selectedTime.minute}");
                  }
                })));
  }

  Widget addCard(BuildContext context) {
    return Card(
        child: SizedBox(
      width: widthc(context),
      child: TextFormField(
          controller: _add,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            icon: Icon(Icons.home),
            hintText: 'Enter your address',
            labelText: 'address',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              Future.delayed(Duration.zero, (){
              _showDialog(context);});
              return '';
            }
            return null;
          }),
    ));
  }

  Widget RadioB(BuildContext context) {
    return Card(
      child: SizedBox(
         height: 57.0,
        width: widthc(context),
        child: Column(children: [
          (MediaQuery.of(context).size.width < 600)?
          Row(children:[const Text('Choose your gender:'),Radio(context)]
          ,):Column(children:[const Text('Choose your gender:'),Radio(context)]),] ))
    );
  }
Widget Radio(BuildContext context)
{
  return
        CustomRadioButton(
           height: 34.2,
          width:60.0,
          elevation: 0,
          absoluteZeroSpacing: false,
          unSelectedColor: Theme.of(context).canvasColor,
          buttonLables: const [
            'Male',
            'Female',
            'Others',
          ],
          buttonValues:const [
            "MALE",
            "FEMALE",
            "OTHERS",
          ],
          buttonTextStyle: ButtonTextStyle(
              selectedColor: Colors.white,
              unSelectedColor: Colors.black,
              textStyle: TextStyle(fontSize: 13)),
          radioButtonValue: (value) {
             _selectedGender = value as String;
             print(_selectedGender);
          },
          selectedColor: Color.fromARGB(255, 45, 54, 102),
        );
}    

  List<Tech> _chipsList = [
    Tech("Android", Colors.green, false),
    Tech("Flutter", Colors.blueGrey, false),
    Tech("Ios", Colors.deepOrange, false),
    Tech("Python", Colors.cyan, false),
    Tech("Go lang", Colors.yellow, false)
  ];
  List<Widget> techChips () {
    List<Widget> chips = [];
    for (int i=0; i< _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left:10, right: 5),
        child: FilterChip(
          label: Text(_chipsList[i].label),
          labelStyle: TextStyle(color: Colors.white),
          backgroundColor: _chipsList[i].color,
          selected: _chipsList[i].isSelected,
          onSelected: (bool value)
          {
            setState(() {
              _chipsList[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

//  Widget chips(BuildContext context){
//    return Chip(
//             elevation: 20,
//             padding: EdgeInsets.all(8),
//             backgroundColor: Colors.greenAccent[100],
//             shadowColor: Colors.black,
//             avatar: CircleAvatar(
//               backgroundImage: NetworkImage(
//                   "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetwordImage
//             ), //CircleAvatar
//             label: Text(
//               'GeeksforGeeks',
//               style: TextStyle(fontSize: 20),
//             ), //Text
//           );//Chip
//  }

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

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("**Warning**", textAlign: TextAlign.center),
          content: const Text("Confirm your address before submit!"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK",style: TextStyle(color: Colors.black),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          elevation: 10,
          backgroundColor: Colors.red,
        );
      },
    );
  
}
}



