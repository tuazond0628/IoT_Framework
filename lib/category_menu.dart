import 'package:flutter/material.dart';
import 'package:iot_framework/categories_page.dart';

class CategoryMenuPage extends StatelessWidget {
  const CategoryMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1D63A3),
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: const Color(0xFF1D63A3),
            title: const Text('USER EXPERIENCE',
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
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'images/dark.jpg',
                  ),
                  fit: BoxFit.cover)),
          child: Material(
            color: Colors.transparent,
            child: GridView(
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              // ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2.1),
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
              ),
              children: [
                InkWell(
                    highlightColor: Colors.white10.withOpacity(0.4),
                    splashColor: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(18.0),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CategoriesPage(
                                  qcategory: 'Convenience'))));
                    },
                    child: Card(
                      color: Colors.pinkAccent,
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 4),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          side: BorderSide(width: 2, color: Colors.pinkAccent)),
                      elevation: 30,
                      child: Column(
                        children: const [
                          SizedBox(height: 40),
                          Icon(Icons.receipt, color: Colors.white, size: 40.0),
                          SizedBox(height: 10),
                          Center(
                              child: Text(
                            'Convenience',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Proxima',
                              color: Colors.white,
                              fontSize: 28,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black87,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    )),
                InkWell(
                    highlightColor: Colors.white10.withOpacity(0.4),
                    splashColor: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(18.0),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CategoriesPage(
                                  qcategory: 'Home Security'))));
                    },
                    child: Card(
                      color: Colors.pinkAccent,
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 4),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          side: BorderSide(width: 2, color: Colors.pinkAccent)),
                      elevation: 30,
                      child: Column(
                        children: const [
                          SizedBox(height: 40),
                          Icon(Icons.security, color: Colors.white, size: 40.0),
                          SizedBox(height: 10),
                          Center(
                              child: Text(
                            'Home\nSecurity',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Proxima',
                              color: Colors.white,
                              fontSize: 27,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black87,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    )),
                InkWell(
                    highlightColor: Colors.white10.withOpacity(0.4),
                    splashColor: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(18.0),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CategoriesPage(
                                  qcategory: 'Personal Assistance'))));
                    },
                    child: Card(
                      color: Colors.pinkAccent,
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 4),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          side: BorderSide(width: 2, color: Colors.pinkAccent)),
                      elevation: 30,
                      child: Column(
                        children: const [
                          SizedBox(height: 40),
                          Icon(Icons.assistant,
                              color: Colors.white, size: 40.0),
                          SizedBox(height: 10),
                          Center(
                              child: Text(
                            'Personal\nAssistance',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Proxima',
                              color: Colors.white,
                              fontSize: 27,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black87,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    )),
                InkWell(
                    highlightColor: Colors.white10.withOpacity(0.4),
                    splashColor: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(18.0),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CategoriesPage(
                                  qcategory: 'Wellness'))));
                    },
                    child: Card(
                      color: Colors.pinkAccent,
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 4),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          side: BorderSide(width: 2, color: Colors.pinkAccent)),
                      elevation: 30,
                      child: Column(
                        children: const [
                          SizedBox(height: 40),
                          Icon(Icons.medical_services,
                              color: Colors.white, size: 40.0),
                          SizedBox(height: 10),
                          Center(
                              child: Text(
                            'Wellness',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Proxima',
                              color: Colors.white,
                              fontSize: 27,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black87,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    )),
                InkWell(
                    highlightColor: Colors.white10.withOpacity(0.4),
                    splashColor: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(18.0),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CategoriesPage(
                                  qcategory: 'Saving Money'))));
                    },
                    child: Card(
                      color: Colors.pinkAccent,
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 4),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          side: BorderSide(width: 2, color: Colors.pinkAccent)),
                      elevation: 30,
                      child: Column(
                        children: const [
                          SizedBox(height: 40),
                          Icon(Icons.money, color: Colors.white, size: 40.0),
                          SizedBox(height: 10),
                          Center(
                              child: Text(
                            'Saving\nMoney',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Proxima',
                              color: Colors.white,
                              fontSize: 27,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black87,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    )),
                InkWell(
                    highlightColor: Colors.white10.withOpacity(0.4),
                    splashColor: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(18.0),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CategoriesPage(
                                  qcategory: 'Saving Time'))));
                    },
                    child: Card(
                      color: Colors.pinkAccent,
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 4),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(18),
                              bottomLeft: Radius.circular(18),
                              topLeft: Radius.circular(18),
                              topRight: Radius.circular(18)),
                          side: BorderSide(width: 2, color: Colors.pinkAccent)),
                      elevation: 30,
                      child: Column(
                        children: const [
                          SizedBox(height: 40),
                          Icon(Icons.lock_clock,
                              color: Colors.white, size: 40.0),
                          SizedBox(height: 10),
                          Center(
                              child: Text(
                            'Saving\nTime',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Proxima',
                              color: Colors.white,
                              fontSize: 27,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black87,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
