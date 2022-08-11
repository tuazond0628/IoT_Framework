import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/school_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
                        child: Image.asset('images/logo.png'),
                      ),
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(height: 50),
                          Text(
                            'IoT Automation Framework',
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
            duration: 3000,
            splashIconSize: 250,
            backgroundColor: const Color(0xFF1D63A3),
            // splashTransition: SplashTransition.fadeTransition,
            nextScreen: const SchoolPage()),
      ),
    );
  }
}
