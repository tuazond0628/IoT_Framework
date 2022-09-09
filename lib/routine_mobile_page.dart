import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/models/appbar.dart';
import 'package:iot_framework/models/routine.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RoutineMobilePage extends StatefulWidget {
  final String qorderBy;
  final String qequalTo;

  const RoutineMobilePage({
    Key? key,
    required this.qorderBy,
    required this.qequalTo,
  }) : super(key: key);

  @override
  State<RoutineMobilePage> createState() => _RoutineMobilePageState();
}

class _RoutineMobilePageState extends State<RoutineMobilePage>
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
    routineList = Routine(0, '', '', '', '', '', '', '', '', '', '', '', '', '',
        '', '', '', '', '');
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
      backgroundColor: const Color(0xFF67A3D9),
      appBar: BaseAppBar(
        title: Text('${widget.qequalTo} Routines',
            style: const TextStyle(
              fontFamily: 'Proxima',
              fontSize: 24,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black87,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            )),
        appBar: AppBar(),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
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
                                elevation: 30,
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
                                            padding: const EdgeInsets.all(15.0)
                                                .copyWith(top: 0),
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
                                            height: 220,
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                height: 60,
                                                alignment: Alignment.centerLeft,
                                                color: Colors.black54,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10.0)
                                                          .copyWith(top: 0),
                                                  child: Text(
                                                    routinesList[index]
                                                        .description,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontFamily: 'Proxima',
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                    ),
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
                                            subtitle: Text(
                                              routinesList[index].routinename,
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontFamily: 'Proxima',
                                                fontSize: 16,
                                                height: 1.2,
                                                // fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.visible,
                                                color: Colors.white,
                                              ),
                                            ),
                                            childrenPadding:
                                                const EdgeInsets.all(16)
                                                    .copyWith(top: 0),
                                            title: const Text(
                                              'Click here to learn more.',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'Proxima',
                                                  color: Colors.white,
                                                  shadows: [
                                                    Shadow(
                                                      blurRadius: 10.0,
                                                      color: Colors.black87,
                                                      offset: Offset(5.0, 5.0),
                                                    ),
                                                  ],
                                                  fontSize: 18),
                                            ),
                                            children: [
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: const TextStyle(
                                                        fontFamily: 'Proxima',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        height: 1.3),
                                                    children: [
                                                      const TextSpan(
                                                        text: '',
                                                      ),
                                                      const WidgetSpan(
                                                        child: Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            'Trigger by: ${routinesList[index].devicetrigger}',
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: const TextStyle(
                                                        fontFamily: 'Proxima',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        height: 1.3),
                                                    children: [
                                                      const TextSpan(
                                                        text: '',
                                                      ),
                                                      const WidgetSpan(
                                                        child: Icon(
                                                          Icons
                                                              .wifi_protected_setup_sharp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            'Initiated by: ${routinesList[index].triggergroup}',
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: const TextStyle(
                                                        fontFamily: 'Proxima',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        height: 1.3),
                                                    children: [
                                                      const TextSpan(
                                                        text: '',
                                                      ),
                                                      const WidgetSpan(
                                                        child: Icon(
                                                          Icons
                                                              .favorite_border_outlined,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: routinesList[
                                                                        index]
                                                                    .numberofaction ==
                                                                'Single'
                                                            ? 'Devices: ${routinesList[index].devicegroup}'
                                                            : 'Devices: \n${routinesList[index].devicegroup}',
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: const TextStyle(
                                                        fontFamily: 'Proxima',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        height: 1.3),
                                                    children: [
                                                      const TextSpan(
                                                        text: '',
                                                      ),
                                                      const WidgetSpan(
                                                        child: Icon(
                                                          Icons
                                                              .notifications_active_rounded,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: routinesList[
                                                                        index]
                                                                    .numberofaction ==
                                                                'Single'
                                                            ? 'Actions: ${routinesList[index].actiongroup}'
                                                            : 'Actions: \n${routinesList[index].actiongroup}',
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: const TextStyle(
                                                        fontFamily: 'Proxima',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        height: 1.3),
                                                    children: [
                                                      const TextSpan(
                                                        text: '',
                                                      ),
                                                      const WidgetSpan(
                                                        child: Icon(
                                                          Icons
                                                              .access_alarms_outlined,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: routinesList[
                                                                        index]
                                                                    .numberofaction ==
                                                                'Single'
                                                            ? 'Active Days: ${routinesList[index].schedule}'
                                                            : 'Active Days: \n${routinesList[index].schedule}',
                                                      )
                                                    ],
                                                  ),
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
                                elevation: 30,
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
                                            padding: const EdgeInsets.all(15.0)
                                                .copyWith(top: 0),
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
                                            height: 220,
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                height: 60,
                                                alignment: Alignment.centerLeft,
                                                color: Colors.black54,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10.0)
                                                          .copyWith(top: 0),
                                                  child: Text(
                                                    routinesList[index]
                                                        .description,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontFamily: 'Proxima',
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                    ),
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
                                            subtitle: Text(
                                              routinesList[index].routinename,
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontFamily: 'Proxima',
                                                fontSize: 16,
                                                height: 1.2,
                                                // fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.visible,
                                                color: Colors.white,
                                              ),
                                            ),
                                            childrenPadding:
                                                const EdgeInsets.all(16)
                                                    .copyWith(top: 0),
                                            title: const Text(
                                              'Click here to learn more.',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'Proxima',
                                                  color: Colors.white,
                                                  shadows: [
                                                    Shadow(
                                                      blurRadius: 10.0,
                                                      color: Colors.black87,
                                                      offset: Offset(5.0, 5.0),
                                                    ),
                                                  ],
                                                  fontSize: 18),
                                            ),
                                            children: [
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: const TextStyle(
                                                        fontFamily: 'Proxima',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        height: 1.3),
                                                    children: [
                                                      const TextSpan(
                                                        text: '',
                                                      ),
                                                      const WidgetSpan(
                                                        child: Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            'Trigger by: ${routinesList[index].devicetrigger}',
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: const TextStyle(
                                                        fontFamily: 'Proxima',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        height: 1.3),
                                                    children: [
                                                      const TextSpan(
                                                        text: '',
                                                      ),
                                                      const WidgetSpan(
                                                        child: Icon(
                                                          Icons
                                                              .wifi_protected_setup_sharp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            'Initiated by: ${routinesList[index].triggergroup}',
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: const TextStyle(
                                                        fontFamily: 'Proxima',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        height: 1.3),
                                                    children: [
                                                      const TextSpan(
                                                        text: '',
                                                      ),
                                                      const WidgetSpan(
                                                        child: Icon(
                                                          Icons
                                                              .favorite_border_outlined,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: routinesList[
                                                                        index]
                                                                    .numberofaction ==
                                                                'Single'
                                                            ? 'Devices: ${routinesList[index].devicegroup}'
                                                            : 'Devices: \n${routinesList[index].devicegroup}',
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: const TextStyle(
                                                        fontFamily: 'Proxima',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        height: 1.3),
                                                    children: [
                                                      const TextSpan(
                                                        text: '',
                                                      ),
                                                      const WidgetSpan(
                                                        child: Icon(
                                                          Icons
                                                              .notifications_active_rounded,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: routinesList[
                                                                        index]
                                                                    .numberofaction ==
                                                                'Single'
                                                            ? 'Actions: ${routinesList[index].actiongroup}'
                                                            : 'Actions: \n${routinesList[index].actiongroup}',
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: const TextStyle(
                                                        fontFamily: 'Proxima',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        height: 1.3),
                                                    children: [
                                                      const TextSpan(
                                                        text: '',
                                                      ),
                                                      const WidgetSpan(
                                                        child: Icon(
                                                          Icons
                                                              .access_alarms_outlined,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: routinesList[
                                                                        index]
                                                                    .numberofaction ==
                                                                'Single'
                                                            ? 'Active Days: ${routinesList[index].schedule}'
                                                            : 'Active Days: \n${routinesList[index].schedule}',
                                                      )
                                                    ],
                                                  ),
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

  void showSuccessfulDialog() => AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        borderSide: const BorderSide(
          color: Color(0xFF018DB2),
          width: 2,
        ),
        width: 350,
        buttonsBorderRadius: const BorderRadius.all(
          Radius.circular(2),
        ),
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false,
        headerAnimationLoop: false,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Done!',
        titleTextStyle: const TextStyle(
          fontFamily: 'Proxima',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        desc: 'Click ok to continue.',
        descTextStyle: const TextStyle(
          fontFamily: 'Proxima',
          fontSize: 16,
        ),
        btnOkColor: Colors.pinkAccent,
        buttonsTextStyle: const TextStyle(
          fontFamily: 'Proxima',
          color: Colors.white,
          fontSize: 20,
        ),
        btnOkOnPress: () {},
      ).show();

  void hyperlink() async {
    await launchUrlString(link, mode: LaunchMode.externalApplication);
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
