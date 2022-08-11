import 'package:flutter/material.dart';
import 'package:iot_framework/device_menu.dart';
import 'package:iot_framework/home_page.dart';
import 'package:iot_framework/category_menu.dart';
import 'package:iot_framework/trigger_menu.dart';
// import 'package:iot_framework/trigger_menu.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    CategoryMenuPage(),
    TriggerMenuPage(),
    DeviceMenuPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar: AppBar(
        //   title: const Text('IoT Automation Framework'),
        //   backgroundColor: const Color(0xFF1D63A3),
        // ),

        body: pages[currentPage],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
                color: Colors.white,
              ),
            ),
            indicatorColor: const Color(0xFF018DB2),
            backgroundColor: Colors.transparent,
          ),
          child: NavigationBar(
            // height: 100,
            backgroundColor: const Color(0xFF013169),
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home',
                selectedIcon: Icon(Icons.home, color: Colors.white),
              ),
              NavigationDestination(
                  icon: Icon(
                    Icons.category,
                    color: Colors.white,
                  ),
                  label: 'Category',
                  selectedIcon: Icon(Icons.category, color: Colors.white)),
              NavigationDestination(
                icon: Icon(
                  Icons.pending_actions_sharp,
                  color: Colors.white,
                ),
                label: 'Trigger',
                selectedIcon:
                    Icon(Icons.pending_actions_sharp, color: Colors.white),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.laptop_mac_sharp,
                  color: Colors.white,
                ),
                label: 'Device',
                selectedIcon: Icon(Icons.laptop_mac_sharp, color: Colors.white),
              ),
            ],
            onDestinationSelected: (int index) {
              setState(() {
                currentPage = index;

                /// Move to different page
              });
            },
            selectedIndex: currentPage,
          ),
        ));
  }
}
