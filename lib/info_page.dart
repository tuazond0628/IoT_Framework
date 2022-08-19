import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D63A3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: FractionalOffset.topCenter,
              child: Image.asset(
                'images/logo.png',
                height: 220,
                width: 220,
              ),
            ),
            const Align(
              alignment: FractionalOffset.topCenter,
              child: Text(
                'IoT Automation Framework',
                style: TextStyle(
                  fontFamily: 'Proxima',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
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
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'images/tup.png',
              height: 190,
              width: 190,
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
              // margin: const EdgeInsets.all(10.0),
              // padding: const EdgeInsets.all(10.0),
              // width: double.infinity,
              child: Text(
                'A Routine accelerator for Alexa smart home users',
                style: TextStyle(
                  fontFamily: 'Proxima',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'images/alexa.png',
              height: 150,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}

// import 'category_page.dart';

// class  xc m  extends StatelessWidget {
//   const InfoPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (BuildContext context) {
//                 return const CategoryPage();
//               },
//             ),
//           );
//         },
//         child: const Text('HOME PAGE'),
//       ),
//     );
//   }
// }
