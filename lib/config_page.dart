import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/root_page.dart';
import 'package:lottie/lottie.dart';
// import 'package:lottie/lottie.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
            splash: Center(
              child: Stack(
                children: [
                  Lottie.asset('images/config.json'),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Loading IoT framework...',
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
                  const SizedBox(height: 50),
                ],
              ),
            ),
            // animationDuration: const Duration(seconds: 6),
            splashIconSize: 400,
            backgroundColor: const Color(0xFF1D63A3),
            nextScreen: const RootPage()),
      ),
    );
  }
}
