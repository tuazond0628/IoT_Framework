import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/models/appbar.dart';
import 'package:iot_framework/models/count.dart';
import 'package:iot_framework/routine_mobile_page.dart';
import 'package:iot_framework/routine_web_page.dart';
import 'package:lottie/lottie.dart';

class TriggerMobileMenuPage extends StatefulWidget {
  const TriggerMobileMenuPage({Key? key}) : super(key: key);

  @override
  State<TriggerMobileMenuPage> createState() => _TriggerMobileMenuPageState();
}

class _TriggerMobileMenuPageState extends State<TriggerMobileMenuPage> {
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
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text('Triggers',
            style: TextStyle(
              fontFamily: 'Proxima',
              fontSize: 28,
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
      backgroundColor: const Color(0xFF1D63A3),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'images/pink.jpg',
                ),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Material(
                color: Colors.transparent,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemExtent: 130.0,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      String devices = list[index].trigger;

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
                                      builder: ((context) => RoutineMobilePage(
                                            qorderBy: list[index].orderby,
                                            qequalTo: list[index].equalto,
                                          ))));
                            }
                          },
                          child: Stack(
                            children: [
                              Card(
                                // color: Colors.pinkAccent,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 140, horizontal: 4),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    side: BorderSide(
                                        width: 1, color: Colors.pinkAccent)),
                                elevation: 20,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFFF8B7CD),
                                        Color(0xFFF6D2E0),
                                        Color(0xFFC8E7F5),
                                        Color(0xFF67A3D9),
                                        Color(0xFF0671B7),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        child: OverflowBox(
                                          minHeight: 115,
                                          maxHeight: 115,
                                          child:
                                              Lottie.asset(list[index].image),
                                        ),
                                      ),
                                      const SizedBox(height: 40),
                                      Center(
                                          child: Text(
                                        devices,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontFamily: 'Proxima',
                                          color: Colors.white,
                                          fontSize: 24,
                                          shadows: [
                                            Shadow(
                                              blurRadius: 10.0,
                                              color: Colors.black87,
                                              offset: Offset(5.0, 5.0),
                                            ),
                                          ],
                                        ),
                                      )),
                                      const SizedBox(height: 40),
                                      Center(
                                          child: CountRoutine(
                                        qorderBy: list[index].orderby,
                                        qequalTo: list[index].equalto,
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ));
                    }),
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
