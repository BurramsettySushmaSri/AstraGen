import 'package:flutter/material.dart';
import 'package:navigation/components/form_page.dart';
import 'model.dart';

class Second_page extends StatefulWidget {
  const Second_page({ Key? key }) : super(key: key);

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
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Card(
            color: Color(0xfffeaf0d),
            child: Container(
                height: 80,
                width: 80,
                child: Icon(
                  Icons.reorder,
                  color: Colors.white,
                  size: 25,
                )),
          ),
          Text(data.name),
          Text(data.phone),
          Text(data.dob),
          Text(data.add),
        ]),
      ),
    );
  }
