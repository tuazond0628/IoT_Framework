import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/models/appbar.dart';
import 'package:iot_framework/models/count.dart';
import 'package:iot_framework/routine_mobile_page.dart';
import 'package:iot_framework/routine_web_page.dart';
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
        device: 'Smart Display',
        orderby: 'Device',
        equalto: 'Smart Display',
        image: 'images/lottie/display.json'),
    Devices(
        device: 'Smart Light',
        orderby: 'Device',
        equalto: 'Smart Light',
        image: 'images/lottie/bulb.json'),
    Devices(
        device: 'Smart Plug',
        orderby: 'Device',
        equalto: 'Smart Plug',
        image: 'images/lottie/plug.json'),
    Devices(
        device: 'Smart Remote',
        orderby: 'Device',
        equalto: 'Smart Remote',
        image: 'images/lottie/remote.json'),
    Devices(
        device: 'Smart Socket',
        orderby: 'Device',
        equalto: 'Smart Socket',
        image: 'images/lottie/wallsocket.json'),
    Devices(
        device: 'Smart Speaker',
        orderby: 'Device',
        equalto: 'Smart Speaker',
        image: 'images/lottie/speaker2.json'),
    Devices(
        device: 'Smart Switch',
        orderby: 'Device',
        equalto: 'Smart Switch',
        image: 'images/lottie/lightswitch.json'),
    Devices(
        device: 'Smartphone',
        orderby: 'Device',
        equalto: 'Smartphone',
        image: 'images/lottie/phone.json'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D63A3),
      appBar: (kIsWeb) // running on the web!
          ? null
          : BaseAppBar(
              title: const Text('Devices',
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
      body: Container(
        alignment: Alignment.center,
        // padding: const EdgeInsets.all(32),

        //     decoration: const BoxDecoration(
        //   color: Colors.blue,
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(10)
        //   )
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: GridView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
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
                        child: GridTile(
                          header: Container(
                            // height: 35,
                            alignment: Alignment.center,
                            child: CountRoutine(
                              qorderBy: list[index].orderby,
                              qequalTo: list[index].equalto,
                            ),
                          ),
                          footer: Container(
                            height: 35,
                            alignment: Alignment.center,
                            child: Text(
                              list[index].device,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontFamily: 'Proxima',
                                color: Colors.white,
                                fontSize: 22,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black87,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Material(
                              // color: Colors.pinkAccent,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(173, 48, 152, 1),
                                      Color.fromRGBO(197, 106, 182, 1),
                                      Color.fromRGBO(229, 124, 194, 1),
                                      Color.fromRGBO(242, 174, 228, 1),
                                      Color.fromRGBO(245, 213, 248, 1),
                                    ],
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                  ),
                                ),
                                child: Lottie.asset(list[index].image,
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: (kIsWeb)
                                ? 4
                                : 2, // check of running on mobile or on web!
                            mainAxisSpacing: 25.0,
                            crossAxisSpacing: 10.0),
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class Devices {
  String device, orderby, equalto, image;

  Devices({
    required this.device,
    required this.orderby,
    required this.equalto,
    required this.image,
  });
}
