import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/models/count.dart';
import 'package:iot_framework/routine_mobile_page.dart';
import 'package:iot_framework/routine_web_page.dart';
import 'package:lottie/lottie.dart';

class DeviceWebMenuPage extends StatefulWidget {
  const DeviceWebMenuPage({Key? key}) : super(key: key);

  @override
  State<DeviceWebMenuPage> createState() => _DeviceWebMenuPageState();
}

class _DeviceWebMenuPageState extends State<DeviceWebMenuPage> {
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
                                      // Color.fromRGBO(173, 48, 152, 1),
                                      Color.fromRGBO(197, 106, 182, 1),
                                      Color.fromRGBO(229, 124, 194, 1),
                                      Color.fromRGBO(242, 174, 228, 1),
                                      Color.fromRGBO(245, 213, 248, 1),
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
                                                  list[index].device,
                                                  maxLines: 3,
                                                  style: const TextStyle(
                                                    fontFamily: 'Proxima',
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 10.0,
                                                        color: Colors.black87,
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

class Devices {
  String device, orderby, equalto, image;

  Devices({
    required this.device,
    required this.orderby,
    required this.equalto,
    required this.image,
  });
}
