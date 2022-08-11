import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('CATEGORIES',
                style: TextStyle(
                    fontFamily: 'Proxima',
                    color: Colors.white,
                    fontWeight: FontWeight.bold))),
        body: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: const [
              Card(
                color: Color(0xFF4573C8),
                elevation: 30,
                child: Center(
                    child: Text(
                  'Convenience',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontSize: 25,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black87,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                      fontWeight: FontWeight.bold),
                )),
              ),
              Card(
                color: Color(0xFFEF8544),
                elevation: 30,
                child: Center(
                    child: Text(
                  'Home\nSecurity',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontSize: 25,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black87,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                      fontWeight: FontWeight.bold),
                )),
              ),
              Card(
                color: Color(0xFF686868),
                elevation: 30,
                child: Center(
                    child: Text(
                  'Personal\nAssistance',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontSize: 25,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black87,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                      fontWeight: FontWeight.bold),
                )),
              ),
              Card(
                color: Colors.purpleAccent,
                elevation: 30,
                child: Center(
                    child: Text(
                  'Wellness',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontSize: 25,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black87,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                      fontWeight: FontWeight.bold),
                )),
              ),
              Card(
                color: Color(0xFFAB7F06),
                elevation: 30,
                child: Center(
                    child: Text(
                  'Saving\nMoney',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontSize: 25,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black87,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                      fontWeight: FontWeight.bold),
                )),
              ),
              Card(
                color: Color(0xFF6CA942),
                elevation: 30,
                child: Center(
                    child: Text(
                  'Saving\nTime',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontSize: 25,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black87,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                      fontWeight: FontWeight.bold),
                )),
              ),
            ]));
  }
}
