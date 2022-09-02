import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/models/count.dart';
import 'package:iot_framework/routine_mobile_page.dart';
import 'package:iot_framework/routine_web_page.dart';
import 'package:lottie/lottie.dart';

class TriggerWebMenuPage extends StatefulWidget {
  const TriggerWebMenuPage({Key? key}) : super(key: key);

  @override
  State<TriggerWebMenuPage> createState() => _TriggerWebMenuPageState();
}

class _TriggerWebMenuPageState extends State<TriggerWebMenuPage> {
  TextEditingController controller = TextEditingController();

  List<Trigger> list = [
    Trigger(
        trigger: 'Alarm',
        orderby: 'Trigger',
        equalto: 'Alarm',
        image: 'images/lottie/alarmclock.json'),
    Trigger(
        trigger: 'Doorbell',
        orderby: 'Trigger',
        equalto: 'Doorbell',
        image: 'images/lottie/alarm.json'),
    Trigger(
        trigger: 'Guard',
        orderby: 'Trigger',
        equalto: 'Guard',
        image: 'images/lottie/lock.json'),
    Trigger(
        trigger: 'Location',
        orderby: 'Trigger',
        equalto: 'Location',
        image: 'images/lottie/location.json'),
    Trigger(
        trigger: 'Sensor',
        orderby: 'Trigger',
        equalto: 'Sensor',
        image: 'images/lottie/sensor2.json'),
    Trigger(
        trigger: 'Schedule',
        orderby: 'Trigger',
        equalto: 'Schedule',
        image: 'images/lottie/schedule.json'),
    Trigger(
        trigger: 'Camera',
        orderby: 'Trigger',
        equalto: 'Camera',
        image: 'images/lottie/cctv.json'),
    Trigger(
        trigger: 'Sound',
        orderby: 'Trigger',
        equalto: 'Sound',
        image: 'images/lottie/sound.json'),
    Trigger(
        trigger: 'Voice',
        orderby: 'Trigger',
        equalto: 'Voice',
        image: 'images/lottie/voice.json'),
  ];

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      backgroundColor: const Color(0xFF1D63A3),
      body: Container(
        alignment: Alignment.center,
        // color: Colors.pinkAccent,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'images/dark.jpg',
                ),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Material(
                color: Colors.transparent,
                child: ListTileTheme(
                  contentPadding: const EdgeInsets.all(15),
                  // iconColor: Colors.red,
                  // tileColor: Colors.pinkAccent,
                  style: ListTileStyle.drawer,
                  dense: true,
                  child: ListView.builder(
                      // scrollDirection: Axis.horizontal,
                      // itemExtent: 90.0,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            highlightColor: Colors.white10.withOpacity(0.4),
                            splashColor: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(18.0),
                            onTap: () {
                              if (kIsWeb) {
                                // running on the web!
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => RoutineWebPage(
                                              qorderBy: list[index].orderby,
                                              qequalTo: list[index].equalto,
                                            ))));
                              } else {
                                // running on mobile (Android or iPhone)
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            RoutineMobilePage(
                                              qorderBy: list[index].orderby,
                                              qequalTo: list[index].equalto,
                                            ))));
                              }
                            },
                            child: Card(
                              color: Colors.pinkAccent,
                              clipBehavior: Clip.antiAlias,
                              elevation: 20,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                // height: 350,
                                // width: width,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFF8B7CD),
                                      Color(0xFFF6D2E0),
                                      // Color(0xFFC8E7F5),
                                      Color(0xFF67A3D9),
                                      Color(0xFF0671B7),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 85,
                                          height: 85,
                                          child: Lottie.asset(
                                            list[index].image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              CountRoutine(
                                                qorderBy: list[index].orderby,
                                                qequalTo: list[index].equalto,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                // width: width,
                                                child: Text(
                                                  list[index].trigger,
                                                  maxLines: 3,
                                                  style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.black87,
                                                    fontSize: 25,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.white70,
                                                        offset:
                                                            Offset(5.0, 5.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      }),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class Trigger {
  String trigger, equalto, orderby, image;

  Trigger(
      {required this.trigger,
      required this.equalto,
      required this.orderby,
      required this.image});
}
