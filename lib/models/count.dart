// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CountRoutine extends StatefulWidget {
  final String qorderBy;
  final String qequalTo;

  const CountRoutine({
    Key? key,
    required this.qorderBy,
    required this.qequalTo,
  }) : super(key: key);

  @override
  State<CountRoutine> createState() => _CountRoutineState();
}

class _CountRoutineState extends State<CountRoutine> {
  Future<DatabaseEvent> getData() async {
    final dbRef = FirebaseDatabase.instance
        .ref()
        .child('Routine')
        .orderByChild(widget.qorderBy)
        .equalTo(widget.qequalTo);

    return await dbRef.once();
  }

  int intCount = 0;
  int key2 = 0;

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
            return Text(
              'Routines: $intCount',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Proxima',
                color: Colors.white,
                fontSize: 13,
                background: Paint()
                  ..strokeWidth = 13
                  ..color = const Color(0xFF1D63A3)
                  ..strokeJoin = StrokeJoin.round
                  ..strokeCap = StrokeCap.round
                  ..style = PaintingStyle.stroke,
              ),
            );
          }
          return Container();
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
