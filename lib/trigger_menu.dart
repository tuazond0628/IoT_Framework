import 'package:flutter/material.dart';
import 'package:iot_framework/models/count.dart';
import 'package:iot_framework/routine_page.dart';
import 'package:lottie/lottie.dart';

class TriggerMenuPage extends StatefulWidget {
  const TriggerMenuPage({Key? key}) : super(key: key);

  @override
  State<TriggerMenuPage> createState() => _TriggerMenuPageState();
}

class _TriggerMenuPageState extends State<TriggerMenuPage> {
  TextEditingController controller = TextEditingController();

  List<Trigger> list = [
    Trigger(
        trigger: 'Alarm',
        orderby: 'Trigger',
        equalto: 'Alarm',
        image: 'images/lottie/alarm.json'),
    Trigger(
        trigger: 'Device',
        orderby: 'Trigger',
        equalto: 'Device',
        image: 'images/lottie/device.json'),
    Trigger(
        trigger: 'Guard',
        orderby: 'Trigger',
        equalto: 'Guard',
        image: 'images/lottie/guard.json'),
    Trigger(
        trigger: 'Location',
        orderby: 'Trigger',
        equalto: 'Guard',
        image: 'images/lottie/location.json'),
    Trigger(
        trigger: 'Schedule',
        orderby: 'Trigger',
        equalto: 'Schedule',
        image: 'images/lottie/schedule.json'),
    Trigger(
        trigger: 'Sound',
        orderby: 'Trigger',
        equalto: 'Sound',
        image: 'images/lottie/sound.json'),
    Trigger(
        trigger: 'Speaker',
        orderby: 'Trigger',
        equalto: 'Speaker',
        image: 'images/lottie/speaker.json'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D63A3),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          // shadowColor: const Color(0xFF1D63A3),
          title: const Text('AUTOMATION TRIGGERS',
              style: TextStyle(
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
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'images/blue.jpg',
                ),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => RoutinePage(
                                          qorderBy: list[index].orderby,
                                          qequalTo: list[index].equalto,
                                        ))));
                          },
                          child: Stack(
                            children: [
                              Card(
                                color: Colors.pinkAccent,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 140, horizontal: 4),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    side: BorderSide(
                                        width: 3, color: Colors.pinkAccent)),
                                elevation: 20,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      child: OverflowBox(
                                        minHeight: 115,
                                        maxHeight: 115,
                                        child: Lottie.asset(list[index].image),
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
