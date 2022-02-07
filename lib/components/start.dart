import 'package:flutter/material.dart';
import 'package:navigation/components/second_page.dart';
import 'package:navigation/util/constants.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Align(
        alignment: Alignment.center,
        child: Padding(
          padding: constants.pad,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Second_page()),
              );
            },
            child: const Text("Start"),
          ),
        ),
      )
    ]);
  }
}
