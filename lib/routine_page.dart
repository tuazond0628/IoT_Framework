import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/models/Routine.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RoutinePage extends StatefulWidget {
  final String qorderBy;
  final String qequalTo;

  const RoutinePage({
    Key? key,
    required this.qorderBy,
    required this.qequalTo,
  }) : super(key: key);

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage>
    with SingleTickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  late AnimationController animationController;

  List<Routine> routinesList = [];

  late Routine routineList;
  late DatabaseReference firebaseRef;
  late DatabaseReference firebaseRef1;

  int key2 = 0;
  String link = '';

  @override
  void initState() {
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
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text('${widget.qequalTo} Routines',
              style: const TextStyle(
                fontFamily: 'Proxima',
                fontSize: 27,
                color: Colors.black87,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.white,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ))),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                          .orderByChild(widget.qorderBy)
                          .equalTo(widget.qequalTo),
                      itemBuilder: (BuildContext context, DataSnapshot snapshot,
                          Animation<double> animation, int index) {
                        routinesList.add(Routine.fromSnapshot(snapshot));
                        int key = routinesList[index].key;
                        String cardImage = routinesList[index].images;
                        String name = routinesList[index].numberofaction +
                            routinesList[index].routinename +
                            routinesList[index].description;

                        if (key2 != key) {
                          key2 = key;

                          if (controller.text.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: ClipRRect(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Stack(
                                        children: [
                                          Ink.image(
                                              height: 220,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${routinesList[index].numberofaction} Action',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Proxima',
                                                    fontSize: 18,
                                                    background: Paint()
                                                      ..strokeWidth = 18
                                                      ..color = routinesList[
                                                                      index]
                                                                  .numberofaction ==
                                                              'Single'
                                                          ? Colors.pinkAccent
                                                          : const Color(
                                                              0xFF1D63A3)
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
                                                        link =
                                                            routinesList[index]
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
                                                            routinesList[index]
                                                                        .numberofaction ==
                                                                    'Single'
                                                                ? const Color(
                                                                    0xFF1D63A3)
                                                                : Colors
                                                                    .pinkAccent,
                                                          ),
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      18.0),
                                                              side: BorderSide(
                                                                  color: routinesList[index]
                                                                              .numberofaction ==
                                                                          'Single'
                                                                      ? Colors
                                                                          .pinkAccent
                                                                      : const Color(
                                                                          0xFF1D63A3)))))),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 205,
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16)
                                                        .copyWith(top: 0),
                                                child: Text(
                                                  routinesList[index]
                                                      .description,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Proxima',
                                                    fontSize: 20,
                                                    height: 1.8,
                                                    overflow:
                                                        TextOverflow.visible,
                                                    shadows: const [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.black87,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                    background: Paint()
                                                      ..strokeWidth = 18
                                                      ..color = Colors.black38
                                                      ..style =
                                                          PaintingStyle.fill,
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
                                            backgroundColor: routinesList[index]
                                                        .numberofaction ==
                                                    'Single'
                                                ? Colors.pinkAccent
                                                : const Color(0xFF1D63A3),
                                            collapsedBackgroundColor:
                                                routinesList[index]
                                                            .numberofaction ==
                                                        'Single'
                                                    ? Colors.pinkAccent
                                                    : const Color(0xFF1D63A3),
                                            subtitle: const Text(
                                              'Click here for more details.',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontFamily: 'Proxima',
                                                fontSize: 13,
                                                height: 1.2,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.visible,
                                                color: Colors.white,
                                              ),
                                            ),
                                            childrenPadding:
                                                const EdgeInsets.all(16)
                                                    .copyWith(top: 0),
                                            title: Text(
                                              routinesList[index].routinename,
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  fontFamily: 'Proxima',
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            children: [
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  'Routine ID: ${routinesList[index].key}',
                                                  style: const TextStyle(
                                                      fontFamily: 'Proxima',
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      height: 1.2,
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
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      height: 1.2,
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
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      height: 1.2,
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
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      height: 1.2,
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
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      height: 1.2,
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
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      height: 1.2,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  'Number of Action: ${routinesList[index].numberofaction}',
                                                  style: const TextStyle(
                                                      fontFamily: 'Proxima',
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      height: 1.2,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
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
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: ClipRRect(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Stack(
                                        children: [
                                          Ink.image(
                                              height: 220,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${routinesList[index].numberofaction} Action',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Proxima',
                                                    fontSize: 18,
                                                    background: Paint()
                                                      ..strokeWidth = 18
                                                      ..color = routinesList[
                                                                      index]
                                                                  .numberofaction ==
                                                              'Single'
                                                          ? Colors.pinkAccent
                                                          : const Color(
                                                              0xFF1D63A3)
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
                                                        link =
                                                            routinesList[index]
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
                                                            routinesList[index]
                                                                        .numberofaction ==
                                                                    'Single'
                                                                ? const Color(
                                                                    0xFF1D63A3)
                                                                : Colors
                                                                    .pinkAccent,
                                                          ),
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      18.0),
                                                              side: BorderSide(
                                                                  color: routinesList[index]
                                                                              .numberofaction ==
                                                                          'Single'
                                                                      ? Colors
                                                                          .pinkAccent
                                                                      : const Color(
                                                                          0xFF1D63A3)))))),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 205,
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16)
                                                        .copyWith(top: 0),
                                                child: Text(
                                                  routinesList[index]
                                                      .description,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Proxima',
                                                    fontSize: 20,
                                                    height: 1.8,
                                                    overflow:
                                                        TextOverflow.visible,
                                                    shadows: const [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.black87,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                    background: Paint()
                                                      ..strokeWidth = 18
                                                      ..color = Colors.black38
                                                      ..style =
                                                          PaintingStyle.fill,
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
                                            backgroundColor: routinesList[index]
                                                        .numberofaction ==
                                                    'Single'
                                                ? Colors.pinkAccent
                                                : const Color(0xFF1D63A3),
                                            collapsedBackgroundColor:
                                                routinesList[index]
                                                            .numberofaction ==
                                                        'Single'
                                                    ? Colors.pinkAccent
                                                    : const Color(0xFF1D63A3),
                                            subtitle: const Text(
                                              'Click here for more details.',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontFamily: 'Proxima',
                                                fontSize: 13,
                                                height: 1.2,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.visible,
                                                color: Colors.white,
                                              ),
                                            ),
                                            childrenPadding:
                                                const EdgeInsets.all(16)
                                                    .copyWith(top: 0),
                                            title: Text(
                                              routinesList[index].routinename,
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  fontFamily: 'Proxima',
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            children: [
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  'Routine ID: ${routinesList[index].key}',
                                                  style: const TextStyle(
                                                      fontFamily: 'Proxima',
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      height: 1.2,
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
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      height: 1.2,
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
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      height: 1.2,
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
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      height: 1.2,
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
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      height: 1.2,
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
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      height: 1.2,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  'Number of Action: ${routinesList[index].numberofaction}',
                                                  style: const TextStyle(
                                                      fontFamily: 'Proxima',
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      height: 1.2,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
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
      ),
    );
  }

  void showRocketlDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            Lottie.asset(
              'images/lottie/running.json',
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
              'images/lottie/success.json',
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
