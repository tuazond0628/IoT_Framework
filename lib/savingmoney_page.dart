import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class SavingMoneyPage extends StatefulWidget {
  const SavingMoneyPage({Key? key}) : super(key: key);

  @override
  State<SavingMoneyPage> createState() => _SavingMoneyPageState();
}

class _SavingMoneyPageState extends State<SavingMoneyPage> {
  final firebaseRef = FirebaseDatabase.instance.ref().child('Saving Money');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FirebaseAnimatedList(
              shrinkWrap: true,
              query: firebaseRef.orderByChild('Location').equalTo('Bedroom'),
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                // if(!snapshot.exists) {
                //   final values = snapshot. as dynamic;

                //               // values.forEach()
                //     // return fancy loading stuff
                //  }
                return Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text('Name: '),
                          Text((snapshot.value as dynamic)['Routine_Name']),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Location: '),
                          Text((snapshot.value as dynamic)['Location']),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Action: '),
                          Text((snapshot.value as dynamic)['NumberOfAction']),
                          Align(
                              alignment: Alignment.topRight,
                              child: Link(
                                  uri: Uri.parse(
                                      (snapshot.value as dynamic)['URL']),
                                  builder: (context, followLink) =>
                                      ElevatedButton(
                                        onPressed: followLink,
                                        child: const Text(
                                          'Install Routine',
                                        ),
                                      )))
                        ],
                      )
                    ],
                  ),
                  // snapshot.data?.snapshot.value
                );
              })),
    );
  }
}
