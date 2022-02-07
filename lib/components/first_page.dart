// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:navigation/components/second_page.dart';
import 'package:navigation/components/start.dart';
import 'package:navigation/util/constants.dart';

class First_Page extends StatefulWidget {
  const First_Page({Key? key}) : super(key: key);

  @override
  _First_PageState createState() => _First_PageState();
}

class _First_PageState extends State<First_Page> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: new AssetImage("images/astragen_logo.png"),
            ),
          ),
        ),
        const Start(),
        Card(
          child: ListTile(
            title: Text(
              "Welcome to AstraGen",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          color: Colors.grey,
          elevation: 8,
          shadowColor: Colors.blueGrey,
          margin: constants.paddings,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.blueGrey.shade100, width: 1)),
        )
      ],
    );
  }
}
