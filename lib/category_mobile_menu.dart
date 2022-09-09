import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/models/appbar.dart';
import 'package:iot_framework/models/count.dart';
import 'package:iot_framework/routine_mobile_page.dart';
import 'package:iot_framework/routine_web_page.dart';

class CategoryMobileMenuPage extends StatefulWidget {
  const CategoryMobileMenuPage({Key? key}) : super(key: key);

  @override
  State<CategoryMobileMenuPage> createState() => _CategoryMobileMenuPageState();
}

class _CategoryMobileMenuPageState extends State<CategoryMobileMenuPage> {
  TextEditingController controller = TextEditingController();

  String txt = '';

  List<Category> list = [
    Category(
        category: 'Home Security',
        orderby: 'Category',
        equalto: 'Home Security',
        image: 'images/categories/homesecurity.jpg'),
    Category(
        category: 'Voice Assistance',
        orderby: 'Category',
        equalto: 'Voice Assistance',
        image: 'images/categories/personalassistance.jpg'),
    Category(
        category: 'Convenience',
        orderby: 'Category',
        equalto: 'Convenience',
        image: 'images/categories/convenience.jpg'),
    Category(
        category: 'Wellness',
        orderby: 'Category',
        equalto: 'Wellness',
        image: 'images/categories/wellness.jpg'),
    Category(
        category: 'Saving Money',
        orderby: 'Category',
        equalto: 'Saving Money',
        image: 'images/categories/savingmoney.jpg'),
    Category(
        category: 'Saving Time',
        orderby: 'Category',
        equalto: 'Saving Time',
        image: 'images/categories/savingtime.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 10;
    // final double itemWidth = size.width / 10;
    return Scaffold(
        appBar: BaseAppBar(
          title: const Text('Preference',
              style: TextStyle(
                fontFamily: 'Proxima',
                fontSize: 28,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black87,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              )),
          appBar: AppBar(),
        ),
        backgroundColor: const Color(0xFF1D63A3),
        body: Container(
          alignment: Alignment.center,
          // color: Colors.pinkAccent,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'images/pink.jpg',
                  ),
                  fit: BoxFit.cover)),
          child: GridView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Material(
                child: InkWell(
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
                              builder: ((context) => RoutineMobilePage(
                                    qorderBy: list[index].orderby,
                                    qequalTo: list[index].equalto,
                                  ))));
                    }
                  },
                  child: GridTile(
                    header: Container(
                      alignment: Alignment.center,
                      child: CountRoutine(
                        qorderBy: list[index].orderby,
                        qequalTo: list[index].equalto,
                      ),
                    ),
                    footer: Container(
                      height: 60,
                      alignment: Alignment.center,
                      color: Colors.black45,
                      child: Text(
                        list[index].category,
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
                    child: Image.asset(list[index].image, fit: BoxFit.cover),
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 25.0,
              crossAxisSpacing: 10.0,
            ),
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
          ),
        ));
  }
}

class Category {
  String category, equalto, orderby, image;

  Category(
      {required this.category,
      required this.equalto,
      required this.orderby,
      required this.image});
}
