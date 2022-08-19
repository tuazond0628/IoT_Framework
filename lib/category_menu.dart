import 'package:flutter/material.dart';
import 'package:iot_framework/models/count.dart';
import 'package:iot_framework/routine_page.dart';

class CategoryMenuPage extends StatefulWidget {
  const CategoryMenuPage({Key? key}) : super(key: key);

  @override
  State<CategoryMenuPage> createState() => _CategoryMenuPageState();
}

class _CategoryMenuPageState extends State<CategoryMenuPage> {
  TextEditingController controller = TextEditingController();

  String txt = '';

  List<Category> list = [
    Category(
        category: 'Home Security',
        orderby: 'Category',
        equalto: 'Home Security',
        image: 'images/categories/homesecurity.jpg'),
    Category(
        category: 'Personal \nAssistance',
        orderby: 'Category',
        equalto: 'Personal Assistance',
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
          // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          // margin: const EdgeInsets.only(
          //     left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
          // decoration: BoxDecoration(
          //   border: Border.all(color: const Color(0xFF282f61), width: 2.0),
          //   borderRadius: const BorderRadius.all(
          //       Radius.circular(10.0) //                 <--- border radius here
          //       ),
          // ),
          //     decoration: const BoxDecoration(
          //   color: Colors.blue,
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(10)
          //   )
          // ),
          alignment: Alignment.center,
          // color: Colors.pinkAccent,

          // padding: const EdgeInsets.all(32),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'images/blue.jpg',
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
                crossAxisSpacing: 10.0),
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
