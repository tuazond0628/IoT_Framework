import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/navigationbar_mobile.dart';
import 'package:iot_framework/navigationbar_web.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          splash: Stack(
            children: [
              Center(
                  child: (kIsWeb)
                      ? Lottie.asset(
                          'images/lottie/config.json') // running on the web!
                      : Lottie.asset(
                          'images/lottie/rocket.json')), // running on mobile (Android or iPhone)
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      (kIsWeb)
                          ? 'Loading Web application, please wait' // running on the web!
                          : 'Loading Mobile application, please wait', // running on mobile (Android or iPhone)
                      style: TextStyle(
                        fontFamily: 'Proxima',
                        fontSize: 20,
                        background: Paint()
                          ..strokeWidth = 20
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
            ],
          ),
          // animationDuration: const Duration(seconds: 3),
          splashIconSize: 500,
          backgroundColor: const Color(0xFF1D63A3),
          nextScreen: (kIsWeb)
              ? const NavigationBarWebPage()
              : const NavigationBarMobilePage(),
        ),
      ),
    );
  }
}
