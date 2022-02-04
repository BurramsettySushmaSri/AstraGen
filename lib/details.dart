import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  String name, dob, phone, add;
  WelcomePage({Key? key, required this.name, required this.phone, required this.dob, required this.add}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $name'),
              Text('phone: $phone'),
              Text('dob: $dob'),
              Text('add: $add'),
            ],
          ),
        ),
      ),
    );
  }
}
