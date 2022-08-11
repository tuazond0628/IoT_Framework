import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/models/Routine.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TriggerPage extends StatefulWidget {
  final String qtrigger;

  const TriggerPage({
    Key? key,
    required this.qtrigger,
  }) : super(key: key);

  @override
  State<TriggerPage> createState() => _TriggerPageState();
}

class _TriggerPageState extends State<TriggerPage>
    with SingleTickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  late AnimationController animationController;

  List<Routine> routinesList = [];

  late Routine routineList;
  late DatabaseReference firebaseRef;

  int key2 = 0;
  String link = '';

  late UniqueKey keyTile;
  bool isExpanded = false;

  // bool value = true;

  @override
  void initState() {
    keyTile = UniqueKey();
    super.initState();
    routineList = Routine(
        0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
    final FirebaseDatabase database = FirebaseDatabase.instance;
    firebaseRef = database.ref().child('Routine');

    animationController = AnimationController(vsync: this);

    animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        animationController.reset();
        hyperlink();
        showSuccessfulDialog();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D63A3),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          // shadowColor: const Color(0xFF013169),
          title: Text('${widget.qtrigger} Routines',
              style: const TextStyle(
                fontFamily: 'Proxima',
                fontSize: 27,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black87,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ))),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: CupertinoSearchTextField(
                  backgroundColor: Colors.white,
                  placeholder: 'Search...',
                  itemSize: 20,
                  itemColor: CupertinoColors.activeBlue,
                  suffixIcon: const Icon(CupertinoIcons.delete),
                  style: const TextStyle(
                    fontFamily: 'Proxima',
                    fontSize: 22,
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    print(value);
                    setState(() {});
                  },
                  onSubmitted: (value) {},
                  controller: controller,
                ),
              ),
              Expanded(
                  child: Scrollbar(
                child: FirebaseAnimatedList(
                    shrinkWrap: true,
                    query: firebaseRef
                        .orderByChild('Trigger')
                        .equalTo(widget.qtrigger),
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      int key = (snapshot.value as dynamic)['Routine_Key'];
                      String cardImage = (snapshot.value as dynamic)['Images'];
                      String name = (snapshot.value as dynamic)['Routine_Name'];

                      // link = (snapshot.value as dynamic)['URL'];

                      routinesList.add(Routine.fromSnapshot(snapshot));
                      // if (frequency == 'Single') {
                      //   cardImage = 'images/ssunset.jpg';
                      // } else {
                      //   cardImage = 'images/svoice.jpg';
                      // }

                      if (key2 != key) {
                        key2 = key;

                        if (controller.text.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 16,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: ClipRRect(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Stack(
                                      // fit: StackFit.expand,
                                      children: [
                                        Ink.image(
                                            height: 240,
                                            image: AssetImage(cardImage),
                                            fit: BoxFit.fitWidth,
                                            child: InkWell(
                                              onTap: () {},
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.all(16)
                                              .copyWith(top: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${routinesList[index].numberofaction} Action',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Proxima',
                                                  fontSize: 18,
                                                  background: Paint()
                                                    ..strokeWidth = 18
                                                    ..color = Colors.pinkAccent
                                                    ..strokeJoin =
                                                        StrokeJoin.round
                                                    ..strokeCap =
                                                        StrokeCap.round
                                                    ..style =
                                                        PaintingStyle.stroke,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Center(
                                                child: ElevatedButton.icon(
                                                    onPressed: () async {
                                                      showRocketlDialog();
                                                      link = routinesList[index]
                                                          .url;
                                                    },
                                                    icon: const Icon(Icons
                                                        .play_arrow), //icon data for elevated button
                                                    label: const Text(
                                                      'Get',
                                                      style: TextStyle(
                                                        fontFamily: 'Proxima',
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ), //label text
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                          const Color(
                                                              0xFF1D63A3),
                                                        ),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                                side: const BorderSide(
                                                                    color: Colors
                                                                        .pinkAccent))))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 230,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: Text(
                                                routinesList[index].description,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Proxima',
                                                  fontSize: 18,
                                                  shadows: const [
                                                    Shadow(
                                                      blurRadius: 10.0,
                                                      color: Colors.black87,
                                                      offset: Offset(5.0, 5.0),
                                                    ),
                                                  ],
                                                  background: Paint()
                                                    ..strokeWidth = 15
                                                    ..color = Colors.black38
                                                    ..strokeJoin =
                                                        StrokeJoin.round
                                                    ..strokeCap =
                                                        StrokeCap.round
                                                    ..style =
                                                        PaintingStyle.stroke,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0)
                                            .copyWith(top: 0),
                                        child: ExpansionTile(
                                          key: keyTile,
                                          initiallyExpanded: isExpanded,
                                          title: Text(
                                            ' $name',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontFamily: 'Proxima',
                                                color: Colors.black,
                                                fontSize: 18,
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 10.0,
                                                    color: Colors.white,
                                                    offset: Offset(5.0, 5.0),
                                                  ),
                                                ],
                                                fontWeight: FontWeight.bold),
                                          ),
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                'Routine ID: ${routinesList[index].key}',
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                'Device: ${routinesList[index].devicegroup}',
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                'Trigger: ${routinesList[index].triggergroup}',
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                'Action: ${routinesList[index].actiongroup}',
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                'Tags: ${routinesList[index].tags}',
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                'Schedule: ${routinesList[index].schedule}',
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Row(
                                              children: const [
                                                Text(''),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(controller.text.toLowerCase())) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 16,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: ClipRRect(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Stack(
                                      // fit: StackFit.expand,
                                      children: [
                                        Ink.image(
                                            height: 240,
                                            image: AssetImage(cardImage),
                                            fit: BoxFit.fitWidth,
                                            child: InkWell(
                                              onTap: () {},
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.all(16)
                                              .copyWith(top: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${routinesList[index].numberofaction} Action',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Proxima',
                                                  fontSize: 18,
                                                  background: Paint()
                                                    ..strokeWidth = 18
                                                    ..color = Colors.pinkAccent
                                                    ..strokeJoin =
                                                        StrokeJoin.round
                                                    ..strokeCap =
                                                        StrokeCap.round
                                                    ..style =
                                                        PaintingStyle.stroke,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Center(
                                                child: ElevatedButton.icon(
                                                    onPressed: () async {
                                                      showRocketlDialog();
                                                      link = routinesList[index]
                                                          .url;
                                                    },
                                                    icon: const Icon(Icons
                                                        .play_arrow), //icon data for elevated button
                                                    label: const Text(
                                                      'Get',
                                                      style: TextStyle(
                                                        fontFamily: 'Proxima',
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ), //label text
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                          const Color(
                                                              0xFF1D63A3),
                                                        ),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18.0),
                                                                side: const BorderSide(
                                                                    color: Colors
                                                                        .pinkAccent))))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 230,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: Text(
                                                routinesList[index].description,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Proxima',
                                                  fontSize: 18,
                                                  shadows: const [
                                                    Shadow(
                                                      blurRadius: 10.0,
                                                      color: Colors.black87,
                                                      offset: Offset(5.0, 5.0),
                                                    ),
                                                  ],
                                                  background: Paint()
                                                    ..strokeWidth = 15
                                                    ..color = Colors.black38
                                                    ..strokeJoin =
                                                        StrokeJoin.round
                                                    ..strokeCap =
                                                        StrokeCap.round
                                                    ..style =
                                                        PaintingStyle.stroke,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0)
                                            .copyWith(top: 0),
                                        child: ExpansionTile(
                                          key: keyTile,
                                          initiallyExpanded: isExpanded,
                                          title: Text(
                                            ' $name',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontFamily: 'Proxima',
                                                color: Colors.black,
                                                fontSize: 18,
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 10.0,
                                                    color: Colors.white,
                                                    offset: Offset(5.0, 5.0),
                                                  ),
                                                ],
                                                fontWeight: FontWeight.bold),
                                          ),
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                'Routine ID: ${routinesList[index].key}',
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                'Device: ${routinesList[index].devicegroup}',
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                'Trigger: ${routinesList[index].triggergroup}',
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                'Action: ${routinesList[index].actiongroup}',
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                'Tags: ${routinesList[index].tags}',
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                'Schedule: ${routinesList[index].schedule}',
                                                style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Row(
                                              children: const [
                                                Text(''),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }
                      return Container();
                    }),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void showRocketlDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            Lottie.asset(
              'images/running.json',
              repeat: true,
              controller: animationController,
              onLoaded: (compostion) {
                animationController.duration = compostion.duration;
                animationController.forward();
                // Navigator.pop(context);
              },
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Connecting to Alexa app, please wait!',
                    style: TextStyle(
                      fontFamily: 'Proxima',
                      fontSize: 16,
                      background: Paint()
                        ..strokeWidth = 16
                        ..color = Colors.pinkAccent
                        ..strokeJoin = StrokeJoin.round
                        ..strokeCap = StrokeCap.round
                        ..style = PaintingStyle.stroke,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 21)
          ])));

  void showSuccessfulDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            Lottie.asset(
              'images/success.json',
            ),
            const Center(
              child: Text(
                'Done!',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 21)
          ])));

  void hyperlink() async {
    await launchUrlString(link, mode: LaunchMode.externalApplication);
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
