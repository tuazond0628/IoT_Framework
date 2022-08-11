import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ConveniencePage extends StatefulWidget {
  const ConveniencePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<ConveniencePage> createState() => _ConveniencePageState();
}

class _ConveniencePageState extends State<ConveniencePage> {
  final dbRef = FirebaseDatabase.instance.ref().child('Saving Money');

//  @override
//   void initState() {
//     super.initState();
//     _activateListener();
//   }

  List<Map<dynamic, dynamic>> lists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF364A54),
        appBar: AppBar(
            centerTitle: true,
            shadowColor: const Color(0xFF013169),
            title: const Text('CONVENIENCE',
                style: TextStyle(
                    fontFamily: 'Proxima',
                    color: Colors.white,
                    fontWeight: FontWeight.bold))),
        body: FutureBuilder<DatabaseEvent>(
            future: dbRef.once(),
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if (snapshot.hasData && !snapshot.hasError) {
                lists.clear();
                final values =
                    snapshot.data?.snapshot.value as Map<dynamic, dynamic>;
                values.forEach((key, values) {
                  lists.add(values);
                  print(snapshot.data?.snapshot.key);
                  // print(snapshot.data?.snapshot.value);
                });
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: lists.length,
                    itemBuilder: (BuildContext context, int index) {
                      String rname = ' Name: ';
                      String rdesc = ' Desc: ';
                      // String url = 'URL: ';
                      return Card(
                        color: const Color(0xFFEDF0F2),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            side:
                                BorderSide(width: 3, color: Color(0xFFEEF1F3))),
                        elevation: 30,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                rname + lists[index]['Routine_Name'],
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontFamily: 'OpenSans',
                                    letterSpacing: 0.27,
                                    color: Color(0xFF17262A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(rdesc + lists[index]['Routine_Description']),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Link(
                                      uri: Uri.parse(lists[index]['URL']),
                                      builder: (context, followLink) =>
                                          ElevatedButton(
                                            onPressed: followLink,
                                            child: const Text(
                                              'Install Routine',
                                            ),
                                          )))
                            ]
                            // Text(lists[index]['Action_Days']),
                            ),
                      );
                    });
              }
              return const CircularProgressIndicator();
            }));
  }
}
