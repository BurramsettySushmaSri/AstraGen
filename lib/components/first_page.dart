import 'package:flutter/material.dart';
import 'package:navigation/components/second_page.dart';
import 'package:navigation/util/constants.dart';

class First_Page extends StatefulWidget {
  const First_Page({Key? key}) : super(key: key);

  @override
  _First_PageState createState() => _First_PageState();
}

class _First_PageState extends State<First_Page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          image: new AssetImage("images/astragen_logo.png"),
        ),
        ElevatedButton(
          child: const Text('Start'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Second_page()),
            );
          },
        ),
      ],
    );
  }
}
