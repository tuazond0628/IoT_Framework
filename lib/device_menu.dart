import 'package:flutter/material.dart';
import 'package:iot_framework/models/count.dart';
import 'package:iot_framework/routine_page.dart';
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
        orderby: 'Device',
        equalto: 'Bulb',
        image: 'images/lottie/bulb.json'),
    // Devices(
    //     device: 'Plug',
    //     orderby: 'Device',
    //     equalto: 'Plug',
    //     image: 'images/lottie/plug.json'),
    Devices(
        device: 'Sensor',
        orderby: 'Device',
        equalto: 'Sensor',
        image: 'images/lottie/sensor.json'),
    Devices(
        device: 'Smartphone',
        orderby: 'Device',
        equalto: 'Smartphone',
        image: 'images/lottie/phone.json'),
    Devices(
        device: 'Speaker',
        orderby: 'Device',
        equalto: 'Speaker',
        image: 'images/lottie/speaker2.json'),
    // Devices(
    //     device: 'Switch',
    //     orderby: 'Device',
    //     equalto: 'Switch',
    //     image: 'images/lottie/switch.json'),
    Devices(
        device: 'Smart Remote',
        orderby: 'Device',
        equalto: 'Smart Remote',
        image: 'images/lottie/remote.json'),
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
          title: const Text('SMART DEVICES',
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
                child: GridView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Material(
                      child: InkWell(
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
                        child: GridTile(
                          header: CountRoutine(
                            qorderBy: list[index].orderby,
                            qequalTo: list[index].equalto,
                          ),
                          footer: Container(
                            height: 60,
                            alignment: Alignment.center,
                            color: Colors.black45,
                            child: Text(
                              list[index].device,
                              textAlign: TextAlign.left,
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
                            ),
                          ),
                          child: Lottie.asset(list[index].image,
                              fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 25.0,
                      crossAxisSpacing: 10.0),
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
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
