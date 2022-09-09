import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:iot_framework/category_mobile_menu.dart';
import 'package:iot_framework/device_menu.dart';
import 'package:iot_framework/home_menu.dart';
import 'package:iot_framework/info_mobile_page.dart';
import 'package:iot_framework/trigger_mobile_menu.dart';

class NavigationBarMobilePage extends StatefulWidget {
  const NavigationBarMobilePage({Key? key}) : super(key: key);

  @override
  State<NavigationBarMobilePage> createState() =>
      _NavigationBarMobilePageState();
}

class _NavigationBarMobilePageState extends State<NavigationBarMobilePage> {
  ConnectivityResult? connectivityResult;
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivityState();
    getConnectivity();
    super.initState();
  }

  getConnectivityState() => checkConnectivityState(); //Launch

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

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

  showDialogBox() => AwesomeDialog(
        context: context,
        dialogType: DialogType.INFO_REVERSED,
        // barrierColor: Colors.redAccent,
        borderSide: const BorderSide(
          color: Color(0xFF018DB2),
          width: 2,
        ),
        width: 350,
        buttonsBorderRadius: const BorderRadius.all(
          Radius.circular(2),
        ),
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false,
        headerAnimationLoop: false,
        animType: AnimType.BOTTOMSLIDE,
        title: 'No Internet Connection',
        titleTextStyle: const TextStyle(
          fontFamily: 'Proxima',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        desc: 'Check your connection and try again.',
        descTextStyle: const TextStyle(
          fontFamily: 'Proxima',
          fontSize: 16,
        ),

        btnOkColor: Colors.pinkAccent,
        buttonsTextStyle: const TextStyle(
          fontFamily: 'Proxima',
          color: Colors.white,
          fontSize: 20,
        ),
        btnOkOnPress: () async {
          setState(() => isAlertSet = false);
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      ).show();

  Future<void> checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.wifi) {
      print('Connected to a Wi-Fi network');
      isDeviceConnected = true;
    } else if (result == ConnectivityResult.mobile) {
      print('Connected to a mobile network');
      isDeviceConnected = true;
    } else {
      print('Not connected to any network');
      isDeviceConnected = false;
      showDialogBox2();
    }

    setState(() {
      connectivityResult = result;
    });
  }

  showDialogBox2() => AwesomeDialog(
        context: context,
        dialogType: DialogType.INFO_REVERSED,
        borderSide: const BorderSide(
          color: Color(0xFF018DB2),
          width: 2,
        ),
        width: 350,
        buttonsBorderRadius: const BorderRadius.all(
          Radius.circular(2),
        ),
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false,
        headerAnimationLoop: false,
        animType: AnimType.BOTTOMSLIDE,
        title: 'No Internet Connection',
        titleTextStyle: const TextStyle(
          fontFamily: 'Proxima',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        desc: 'Check your connection and try again.',
        descTextStyle: const TextStyle(
          fontFamily: 'Proxima',
          fontSize: 16,
        ),
        btnOkColor: Colors.pinkAccent,
        buttonsTextStyle: const TextStyle(
          fontFamily: 'Proxima',
          color: Colors.white,
          fontSize: 20,
        ),
        btnOkOnPress: () async {
          if (isDeviceConnected == false) {
            checkConnectivityState();
          }
        },
      ).show();
}
