import 'package:flutter/material.dart';
import 'package:navigation/components/form_page.dart';
import 'model.dart';

class Second_page extends StatefulWidget {
  const Second_page({Key? key}) : super(key: key);

  @override
  _second_pageState createState() => _second_pageState();
}

// ignore: camel_case_types
class _second_pageState extends State<Second_page> {
  List<UserData> datalist = List<UserData>.empty(growable: true);
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
          : ListView.builder(
              itemCount: datalist.length,
              itemBuilder: (context, index) =>
                  detailsCard(context, datalist.elementAt(index))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () async {
          final data = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyCustomForm()),
          );
          if (data != null) {
           UserData wel = data as UserData;
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

  Widget detailsCard(BuildContext context, UserData data) {
    return Center(
        child: Card(
            color: Colors.grey[800],
            elevation: 8,
            shadowColor: Colors.green,
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                width: MediaQuery.of(context).size.width / 2,
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  // ignore: unnecessary_new

                  // ignore: unnecessary_new
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                            Card(
                               elevation: 8,
                shadowColor: Colors.green,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                
                color: Color(0xfffeaf0d),
                child: Container(
                  width: 50,
                  height: 50,
                  child: const Icon(
                    Icons.reorder,
                    color: Colors.white,
                  ),
                ),

                        ),
                        Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(data.name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            Text(data.phone,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            Text(data.dob,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            Text(data.add,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                                     Text(data.time,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            // ignore: unnecessary_new

                            // ignore: unnecessary_new
                          ],
                        ),
                        Column(
                          children: [
                            // ignore: unnecessary_new
                            new IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () async {
                                  final getdata = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyCustomForm(
                                                recievedata: data,
                                              )));
                                  if (getdata != null) {
                                    UserData wel = getdata as UserData;
                                    datalist.add(wel);
                                    // datalist.insert(value)

                                    setState(() {});
                                  }
                                }),
                            new IconButton(
                                icon: const Icon(Icons.clear_rounded),
                                onPressed: () {}),
                          ],
                        ),

                        // IconButton(padding:const EdgeInsets.symmetric() ,
                        // icon: const Icon(Icons.clear_all_rounded),
                        // onPressed: () {

                        // }),

                        
                      ])
                ]))));
//   return Center(
//     child: Card(
//       elevation: 8,
//       color: Colors.grey[800],
//       shadowColor: Colors.green,
//       shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       margin: const EdgeInsets.all(20),
//       child: Container(
//         width: MediaQuery.of(context).size.width / 2,
//         child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Card(
//                 elevation: 8,
//                 shadowColor: Colors.green,
//                 shape: BeveledRectangleBorder(
//                     borderRadius: BorderRadius.circular(15)),
//                 margin: EdgeInsets.all(20),
//                 color: Color(0xfffeaf0d),
//                 child: Container(
//                   width: 50,
//                   height: 50,
//                   child: const Icon(
//                     Icons.reorder,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(padding: const EdgeInsets.all(10.0)),
//                     Text(data.name,
//                         style: TextStyle(color: Colors.white, fontSize: 18)),
//                     Text(data.phone,
//                         style: TextStyle(color: Colors.white, fontSize: 18)),
//                     Text(data.dob,
//                         style: TextStyle(color: Colors.white, fontSize: 18)),
//                     Text(data.add,
//                         style: TextStyle(color: Colors.white, fontSize: 18)),
//                   ],
//                 ),
//               ),
//             ]),
//       ),
//     ),
//   );
  }
}
