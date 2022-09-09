// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ConnectivityCheck extends StatefulWidget {
  const ConnectivityCheck({
    Key? key,
  }) : super(key: key);

  @override
  State<ConnectivityCheck> createState() => _ConnectivityCheckState();
}

class _ConnectivityCheckState extends State<ConnectivityCheck> {
  Future<DatabaseEvent> getData() async {
    final dbRef = FirebaseDatabase.instance
        .ref()
        .child('Routine')
        .orderByChild('Routine_ID')
        .equalTo('RoutineID_01');

    return await dbRef.once();
  }

  int intCount = 0;
  int key2 = 0;
  bool isDeviceConnected = false;

  List<Map<dynamic, dynamic>> lists = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DatabaseEvent>(
        future: getData(),
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData && !snapshot.hasError) {
            lists.clear();

            final values =
                snapshot.data?.snapshot.value as Map<dynamic, dynamic>;
            values.forEach((key, values) {
              lists.add(values);

              int key = values['Routine_Key'];

              if (key2 != key) {
                key2 = key;

                intCount = intCount + 1;
              }
            });
            isDeviceConnected = true;
          }
          return Container();
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
