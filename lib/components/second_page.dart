import 'package:flutter/material.dart';
import 'package:navigation/components/form_page.dart';
import 'model.dart';
import 'package:navigation/util/constants.dart';

class Second_page extends StatefulWidget {
  const Second_page({Key? key}) : super(key: key);

  @override
  _second_pageState createState() => _second_pageState();
}

// ignore: camel_case_types
class _second_pageState extends State<Second_page> {
  List<WelcomePage> datalist = List<WelcomePage>.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Users'),
        backgroundColor: Colors.red,
      ),
      body: (datalist.isEmpty)
          ? const Center(
              child: Text('No Data Found'),
            )
          : ListView.builder(itemCount: datalist.length, itemBuilder: (context, index) => detailsCard(datalist.elementAt(index))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () async {
          final data = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyCustomForm()),
          );
          if (data != null) {
            WelcomePage wel = data as WelcomePage;
            print('data:$data');
            datalist.add(wel);
            setState(() {});
          }
        },
        // Respond to button press

        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget detailsCard(WelcomePage data) {
  return Center(
    child: Card(
      elevation: 8,
      shadowColor: Colors.green,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(20),
      child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
        Card(
          elevation: 8,
          shadowColor: Colors.green,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.all(20),
          color: Color(0xfffeaf0d),
          child: Container(
              width: 80,
              height: 80,
              child: const Icon(
                Icons.reorder,
                color: Colors.white,
              )),
        ),
        Text(data.name),
        Text('\t'),
        Text(data.phone),
        Text('\t'),
        Text(data.dob),
        Text('\t'),
        Text(data.add),
      ]),
    ),
  );
}
