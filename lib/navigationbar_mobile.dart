import 'package:flutter/material.dart';
import 'package:iot_framework/category_mobile_menu.dart';
import 'package:iot_framework/device_menu.dart';
import 'package:iot_framework/home_menu.dart';
import 'package:iot_framework/info_mobile_page.dart';
import 'package:iot_framework/trigger_mobile_menu.dart';

class NavigatioBarMobilePage extends StatefulWidget {
  const NavigatioBarMobilePage({Key? key}) : super(key: key);

  @override
  State<NavigatioBarMobilePage> createState() => _NavigatioBarMobilePageState();
}

class _NavigatioBarMobilePageState extends State<NavigatioBarMobilePage> {
  int currentPage = 2;
  List<Widget> pages = const [
    CategoryMobileMenuPage(),
    TriggerMobileMenuPage(),
    InfoMobilePage(),
    DeviceMenuPage(),
    HomeMenuPage(),
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
                    Icons.category,
                    color: Colors.white,
                  ),
                  label: 'Preference',
                  selectedIcon: Icon(Icons.category, color: Colors.white)),
              NavigationDestination(
                icon: Icon(
                  Icons.pending_actions_sharp,
                  color: Colors.white,
                ),
                label: 'Triggers',
                selectedIcon:
                    Icon(Icons.pending_actions_sharp, color: Colors.white),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white,
                ),
                label: 'Info',
                selectedIcon:
                    Icon(Icons.info_outline_rounded, color: Colors.white),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.laptop_mac_sharp,
                  color: Colors.white,
                ),
                label: 'Devices',
                selectedIcon: Icon(Icons.laptop_mac_sharp, color: Colors.white),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home',
                selectedIcon: Icon(Icons.home, color: Colors.white),
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
