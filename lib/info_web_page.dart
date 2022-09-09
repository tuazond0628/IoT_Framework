import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InfoWebPage extends StatelessWidget {
  const InfoWebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            // Color(0xFFF8B7CD),
            // Color(0xFFF6D2E0),
            Color(0xFF67A3D9),
            Color(0xFF0671B7),
            Color(0xFF1D63A3),
            // Color(0xFF013169),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(50.0),
                child: SizedBox(
                  height: 20,
                ),
              ),
              Align(
                alignment: FractionalOffset.topCenter,
                child: (kIsWeb) // running on the web!
                    ? null
                    : Image.asset(
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
                height: 15,
              ),
              const Align(
                alignment: FractionalOffset.topCenter,
                child: Text(
                  '" Bringing IoT Devices to Life "',
                  style: TextStyle(
                    fontFamily: 'Proxima',
                    color: Colors.white,
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
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
                    // fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
