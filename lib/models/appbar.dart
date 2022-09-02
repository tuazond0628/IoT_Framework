import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot_framework/routine_mobile_page.dart';

enum MenuItem {
  recommended,
  exit,
}

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;

  /// you can add more fields that meet your needs

  const BaseAppBar({Key? key, required this.title, required this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        PopupMenuButton<MenuItem>(
            color: const Color(0xFF1D63A3),
            onSelected: (value) {
              if (value == MenuItem.recommended) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RoutineMobilePage(
                          qorderBy: 'Recommended',
                          qequalTo: 'Recommended',
                        )));
              } else if (value == MenuItem.exit) {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              }
            },
            itemBuilder: (context) => [
                  PopupMenuItem(
                    value: MenuItem.recommended,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.recommend_rounded,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Recommended',
                            style: TextStyle(
                                fontFamily: 'Proxima',
                                color: Colors.white,
                                fontSize: 18,
                                height: 1.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: MenuItem.exit,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.exit_to_app_rounded,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Exit App',
                            style: TextStyle(
                                fontFamily: 'Proxima',
                                color: Colors.white,
                                fontSize: 18,
                                height: 1.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
