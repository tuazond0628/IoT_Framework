import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/alexa_page.dart';

class SchoolPage extends StatelessWidget {
  const SchoolPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
            splash: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: OverflowBox(
                        minHeight: 180,
                        maxHeight: 180,
                        child: Image.asset('images/tup.png'),
                      ),
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(height: 100),
                          Text(
                            'Inspired by TUP College of Science',
                            style: TextStyle(
                              fontFamily: 'Proxima',
                              fontSize: 22,
                              background: Paint()
                                ..strokeWidth = 22
                                ..color = Colors.pinkAccent
                                ..strokeJoin = StrokeJoin.round
                                ..strokeCap = StrokeCap.round
                                ..style = PaintingStyle.stroke,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 50),
                  ],
                ),
              ],
            ),
            duration: 300,
            splashIconSize: 250,
            backgroundColor: const Color(0xFF1D63A3),
            // splashTransition: SplashTransition.fadeTransition,
            nextScreen: const AlexaPage()),
      ),
    );
  }
}
