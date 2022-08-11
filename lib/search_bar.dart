import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/Routine.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<SearchPage> createState() => _ConveniencePageState();
}

class _ConveniencePageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();

  List<Routine> itemsShop = [];
  late Routine itemShop;
  late DatabaseReference firebaseRef;
  // final firebaseRef = FirebaseDatabase.instance.ref().child('Saving Money');

  @override
  void initState() {
    super.initState();
    itemShop = Routine(
        0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
    final FirebaseDatabase database = FirebaseDatabase.instance;
    firebaseRef = database.ref().child('Wellness');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CupertinoSearchTextField(
                    placeholder: 'Search',
                    onChanged: (value) {
                      print(value);
                      setState(() {});
                    },
                    onSubmitted: (value) {},
                    controller: controller,
                  ),
                ),
                Expanded(
                    child: FirebaseAnimatedList(
                        shrinkWrap: true,
                        query: firebaseRef,
                        itemBuilder: (BuildContext context,
                            DataSnapshot snapshot,
                            Animation<double> animation,
                            int index) {
                          itemsShop.add(Routine.fromSnapshot(snapshot));
                          String name = itemsShop[index].routinename;

                          if (controller.text.isEmpty) {
                            return Card(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text('Name: '),
                                      Text(itemsShop[index].routinename),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Location: '),
                                      Text(itemsShop[index].location),
                                    ],
                                  )
                                ],
                              ),
                              // snapshot.data?.snapshot.value
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(controller.text.toLowerCase())) {
                            return Card(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text('Name: '),
                                      Text(itemsShop[index].routinename),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Location: '),
                                      Text(itemsShop[index].location),
                                    ],
                                  )
                                ],
                              ),
                              // snapshot.data?.snapshot.value
                            );
                          } else {
                            return Container();
                          }
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
