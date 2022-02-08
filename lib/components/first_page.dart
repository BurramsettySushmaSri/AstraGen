// ignore_for_file: camel_case_types

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
    return Stack(
      
        children: <Widget>[
          Container( 
            child: Image(
                image: new AssetImage("images/bg8.png"),
                fit: BoxFit.fill,
              width : MediaQuery. of(context). size. width ,
    height : MediaQuery. of(context). size. height,
              ),

          ),


         Align(
            alignment: Alignment.bottomCenter,
            
              child: Image(
                image: new AssetImage("images/astragen_logo.png"),
              ),
          
          ),
          Align(alignment: Alignment.center,
        
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 179, 171, 171), // background
                        onPrimary: Colors.white, // foreground
                      ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Second_page()),
              );
            },

            child: const Text("Start"),
          ), ),
          
          
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
          ),
          
        ],
        
    );
      
  }
}
