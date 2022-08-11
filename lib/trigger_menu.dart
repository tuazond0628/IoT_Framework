import 'package:flutter/material.dart';
import 'package:iot_framework/trigger_page.dart';
import 'package:lottie/lottie.dart';

class TriggerMenuPage extends StatefulWidget {
  const TriggerMenuPage({Key? key}) : super(key: key);

  @override
  State<TriggerMenuPage> createState() => _TriggerMenuPageState();
}

class _TriggerMenuPageState extends State<TriggerMenuPage> {
  TextEditingController controller = TextEditingController();

  List<Devices> list = [
    Devices(
        device: 'Alarm',
        subTitle: 'Flutter developer',
        image: 'images/alarm.json',
        isFavourite: true),
    Devices(
        device: 'Device',
        subTitle: 'Github.com',
        image: 'images/device.json',
        isFavourite: true),
    Devices(
        device: 'Guard',
        subTitle: 'Marketing guy',
        image: 'images/guard.json',
        isFavourite: false),
    Devices(
        device: 'Location',
        subTitle: 'Java developer',
        image: 'images/location.json',
        isFavourite: true),
    Devices(
        device: 'Schedule',
        subTitle: 'Blockchain is new trend',
        image: 'images/schedule.json',
        isFavourite: true),
    Devices(
        device: 'Sound',
        subTitle: 'Exploring world',
        image: 'images/sound.json',
        isFavourite: false),
    Devices(
        device: 'Speaker',
        subTitle: 'TRS on Fiverr',
        image: 'images/speaker.json',
        isFavourite: false),
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
          title: const Text('TRIGGERS',
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
                      String devices = list[index].device;

                      return InkWell(
                          highlightColor: Colors.white10.withOpacity(0.4),
                          splashColor: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(18.0),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        TriggerPage(qtrigger: devices))));
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

class Devices {
  String device, image, subTitle;
  bool isFavourite;

  Devices(
      {required this.device,
      required this.isFavourite,
      required this.image,
      required this.subTitle});
}

//Costom CLipper class with Path
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(
        0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
