import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:iot_framework/category_web_menu.dart';
import 'package:iot_framework/device_web_menu..dart';
import 'package:iot_framework/home_menu.dart';
import 'package:iot_framework/info_web_page.dart';
import 'package:iot_framework/routine_web_page.dart';
import 'package:iot_framework/trigger_web_menu.dart';

class NavigationBarWebPage extends StatefulWidget {
  const NavigationBarWebPage({
    Key? key,
  }) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _NavigationBarWebPageState createState() => _NavigationBarWebPageState();
}

class _NavigationBarWebPageState extends State<NavigationBarWebPage> {
  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        backgroundColor: const Color(0xFF1D63A3),
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              child: const Icon(
                Icons.recommend,
                color: Colors.white,
              ),
              label: 'Recommended',
              backgroundColor: const Color(0xFF1D63A3),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RoutineWebPage(
                        qorderBy: 'Recommended',
                        qequalTo: 'Recommended',
                      )))),
          // SpeedDialChild(
          //     child: const Icon(
          //       Icons.exit_to_app,
          //       color: Colors.white,
          //     ),
          //     label: 'Exit App',
          //     backgroundColor: const Color(0xFF1D63A3),
          //     onTap: () => Navigator.of(context).pop())
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            onDisplayModeChanged: (mode) {
              print(mode);
            },
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFF8B7CD),
                    Color(0xFFF6D2E0),
                    Color(0xFFC8E7F5),
                    Color(0xFF67A3D9),
                    Color(0xFF0671B7),
                    Color(0xFF1D63A3),
                    Color(0xFF013169),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.zero),
              ),
              // backgroundColor: const Color(0xFF1D63A3),
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 160,
                    maxWidth: 160,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'images/iconlogo.png',
                        height: 300,
                        width: 300,
                        // color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                  thickness: 2.0,
                  color: Colors.white,
                ),
              ],
            ),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('web app version 1.0',
                  style: TextStyle(
                    fontFamily: 'Proxima',
                    fontSize: 15,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black87,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  )),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Info',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: const Icon(Icons.info_outline),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Preference',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: const Icon(Icons.linked_camera_outlined),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Triggers',
                onTap: () {
                  page.jumpToPage(2);
                },
                icon: const Icon(Icons.pending_actions_sharp),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Devices',
                onTap: () {
                  page.jumpToPage(3);
                },
                icon: const Icon(Icons.laptop_mac_sharp),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Home',
                onTap: () {
                  page.jumpToPage(4);
                },
                icon: const Icon(Icons.home_work_outlined),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: const [
                InfoWebPage(),
                CategoryWebMenuPage(),
                TriggerWebMenuPage(),
                DeviceWebMenuPage(),
                HomeMenuPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
