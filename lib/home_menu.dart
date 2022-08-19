import 'package:flutter/material.dart';
import 'package:iot_framework/models/count.dart';
import 'package:iot_framework/routine_page.dart';

class HomeMenuPage extends StatefulWidget {
  const HomeMenuPage({Key? key}) : super(key: key);

  @override
  State<HomeMenuPage> createState() => _HomeMenuPageState();
}

class _HomeMenuPageState extends State<HomeMenuPage> {
  TextEditingController controller = TextEditingController();

  String txt = '';

  List<Home> list = [
    Home(
        location: 'Backyard',
        orderby: 'Location',
        equalto: 'Backyard',
        image: 'images/backyard.png'),
    Home(
        location: 'Bathroom',
        orderby: 'Location',
        equalto: 'Bathroom',
        image: 'images/bathroom.png'),
    Home(
        location: 'Bedroom',
        orderby: 'Location',
        equalto: 'Bedroom',
        image: 'images/bedroom.png'),
    Home(
        location: 'FrontGate',
        orderby: 'Location',
        equalto: 'FrontGate',
        image: 'images/frontgate.png'),
    Home(
        location: 'FrontYard',
        orderby: 'Location',
        equalto: 'FrontYard',
        image: 'images/frontyard.png'),
    Home(
        location: 'Garage',
        orderby: 'Location',
        equalto: 'Garage',
        image: 'images/garage.png'),
    Home(
        location: 'Garden',
        orderby: 'Location',
        equalto: 'Garden',
        image: 'images/garden.png'),
    Home(
        location: 'GPS',
        orderby: 'Location',
        equalto: 'GPS',
        image: 'images/gps.png'),
    Home(
        location: 'Kitchen',
        orderby: 'Location',
        equalto: 'Kitchen',
        image: 'images/kitchen.png'),
    Home(
        location: 'Living Room',
        orderby: 'Location',
        equalto: 'Living Room',
        image: 'images/livingroom.png'),
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
          title: const Text('HOME LOCATION',
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
        // padding: const EdgeInsets.all(32),
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
                child: ListTileTheme(
                  contentPadding: const EdgeInsets.all(15),
                  // iconColor: Colors.red,
                  // tileColor: Colors.pinkAccent,
                  style: ListTileStyle.drawer,
                  dense: true,
                  child: ListView.builder(
                      // scrollDirection: Axis.horizontal,
                      itemExtent: 90.0,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        String devices = list[index].location;

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
                            child: Card(
                              color: Colors.pinkAccent,
                              elevation: 30,
                              child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 10.0),
                                  leading: Container(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                width: 1.0,
                                                color: Colors.white))),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Material(
                                        color: Colors.white,
                                        child: Image.asset(
                                          list[index].image,
                                          width: 80,
                                          height: 80,
                                          // fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    devices,
                                    // textAlign: TextAlign.center,
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
                                  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                                  subtitle: Row(
                                    children: <Widget>[
                                      const SizedBox(height: 40),
                                      CountRoutine(
                                        qorderBy: list[index].orderby,
                                        qequalTo: list[index].equalto,
                                      )
                                    ],
                                  ),
                                  trailing: const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.white,
                                      size: 30.0)),
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

class Home {
  String location, equalto, orderby, image;

  Home(
      {required this.location,
      required this.equalto,
      required this.orderby,
      required this.image});
}
