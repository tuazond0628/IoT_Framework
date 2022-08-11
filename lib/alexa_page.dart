import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/root_page.dart';
import 'package:lottie/lottie.dart';

class AlexaPage extends StatelessWidget {
  const AlexaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
            splash: Stack(
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Image.asset('images/iconlogo.png'),
                      ),
                      Expanded(
                        child: OverflowBox(
                          minHeight: 50,
                          maxHeight: 50,
                          child: Lottie.asset(
                            'images/arrow.json',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Image.asset('images/alexalogo.png'),
                      ),
                    ]),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 100),
                      Text(
                        'Works with Amazon Alexa.',
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
              ],
            ),
            duration: 3000,
            splashIconSize: 250,
            // backgroundColor: const Color(0xFF1D63A3),
            // splashTransition: SplashTransition.fadeTransition,
            nextScreen: const RootPage()),
      ),
    );
  }
}
