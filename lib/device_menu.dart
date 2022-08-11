import 'package:flutter/material.dart';
import 'package:iot_framework/device_page.dart';
import 'package:lottie/lottie.dart';

class DeviceMenuPage extends StatefulWidget {
  const DeviceMenuPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DeviceMenuPage> createState() => _DeviceMenuPageState();
}

class _DeviceMenuPageState extends State<DeviceMenuPage> {
  TextEditingController controller = TextEditingController();

  List<Devices> list = [
    Devices(
        device: 'Bulb',
        subTitle: 'Flutter developer',
        image: 'images/bulb.json',
        isFavourite: true),
    Devices(
        device: 'Plug',
        subTitle: 'Github.com',
        image: 'images/plug.json',
        isFavourite: true),
    Devices(
        device: 'Sensor',
        subTitle: 'Marketing guy',
        image: 'images/sensor.json',
        isFavourite: false),
    Devices(
        device: 'Smartphone',
        subTitle: 'Java developer',
        image: 'images/phone.json',
        isFavourite: true),
    Devices(
        device: 'Speaker',
        subTitle: 'Blockchain is new trend',
        image: 'images/speaker2.json',
        isFavourite: true),
    Devices(
        device: 'Switch',
        subTitle: 'Exploring world',
        image: 'images/switch.json',
        isFavourite: false),
    Devices(
        device: 'Smart Remote',
        subTitle: 'TRS on Fiverr',
        image: 'images/remote.json',
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
          shadowColor: const Color(0xFF1D63A3),
          title: const Text('DEVICES',
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
                  'images/sky.jpg',
                ),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Material(
                color: Colors.transparent,
                child: ListView.builder(
                    itemExtent: 135.0,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      String devices = list[index].device;

                      if (controller.text.isEmpty) {
                        return InkWell(
                            highlightColor: Colors.white10.withOpacity(0.4),
                            splashColor: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(18.0),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          DevicesPage(qdevices: devices))));
                            },
                            child: Stack(
                              children: [
                                Card(
                                  color: Colors.pinkAccent,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 2),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      side: BorderSide(
                                          width: 3, color: Colors.pinkAccent)),
                                  elevation: 10,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // CircleAvatar(
                                      Lottie.asset(
                                        (list[index].image),
                                        // repeat: false,
                                        // reverse: false,
                                        // animate: false,
                                      ),
                                      //   maxRadius: 30,
                                      //   minRadius: 30,
                                      // ),
                                      Center(
                                          child: Text(
                                        devices,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontFamily: 'Proxima',
                                          color: Colors.white,
                                          fontSize: 26,
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
                      } else if (devices
                          .toLowerCase()
                          .contains(controller.text.toLowerCase())) {
                        return InkWell(
                            highlightColor: Colors.orange.withOpacity(0.4),
                            splashColor: Colors.orangeAccent.withOpacity(0.5),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          DevicesPage(qdevices: devices))));
                            },
                            child: Stack(
                              children: [
                                Card(
                                  color: Colors.pinkAccent,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 20),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      side: BorderSide(
                                          width: 2, color: Color(0xFF1D63A3))),
                                  elevation: 10,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      // CircleAvatar(
                                      Lottie.network(
                                        (list[index].image),
                                        // repeat: false,
                                        // reverse: false,
                                        // animate: false,
                                      ),
                                      //   maxRadius: 30,
                                      //   minRadius: 30,
                                      // ),
                                      Center(
                                          child: Text(
                                        devices,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontFamily: 'Proxima',
                                          color: Colors.white,
                                          fontSize: 28,
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
                      } else {
                        return Container();
                      }
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
