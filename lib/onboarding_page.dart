import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:iot_framework/loading_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'IoT Automation Framework',
        body: 'Your accelerated path to Smart Home Automation',
        image: Center(
          child: Image.asset(
            'images/ourlogo.png',
            fit: BoxFit.cover,
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontFamily: 'Proxima',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'All-In-One Library',
        body:
            'Enable fast smart home automation with its collection of ready-to-install Alexa routines',
        image: Center(
          child: Image.asset(
            'images/alexa3.png',
            fit: BoxFit.cover,
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontFamily: 'Proxima',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'Discover Smart Home Automation',
        body:
            'Learn how can each IoT devices works and communicate with one another',
        image: Center(
          child: Image.asset(
            'images/about.png',
            fit: BoxFit.cover,
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontFamily: 'Proxima',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
      title: 'Here We Start!',
      body:
          'Search and filter the best automation routines according to your needs',
      image: Center(
        child: Image.asset(
          'images/Iotdevices.png',
          fit: BoxFit.cover,
        ),
      ),
      decoration: const PageDecoration(
          titleTextStyle: TextStyle(
        fontFamily: 'Proxima',
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      )),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFFFFFFF),
      // appBar: AppBar(
      //   title: const Text('Flutter on Boarding UI'),
      //   centerTitle: true,
      // ),
      body: Container(
        decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Color(0xFFF8B7CD),
              Color(0xFFF6D2E0),
              Color(0xFFC8E7F5),
              Color(0xFF67A3D9),
              Color(0xFF0671B7),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
          child: IntroductionScreen(
            pages: pages,
            globalBackgroundColor: Colors.transparent,
            dotsDecorator: const DotsDecorator(
              size: Size(12, 12),
              color: Color(0xFF0671B7),
              activeSize: Size.square(16),
              activeColor: Colors.pinkAccent,
            ),
            showDoneButton: true,
            done: const Text(
              'Done',
              style: TextStyle(
                fontFamily: 'Proxima',
                fontSize: 20,
                color: Color(0xFF0671B7),
              ),
            ),
            showSkipButton: true,
            skip: const Text(
              'Skip',
              style: TextStyle(
                fontFamily: 'Proxima',
                fontSize: 20,
                color: Color(0xFF0671B7),
              ),
            ),
            showNextButton: true,
            next: const Icon(
              Icons.arrow_forward,
              size: 22,
              color: Color(0xFF0671B7),
            ),
            onDone: () => onDone(context),
            curve: Curves.bounceOut,
          ),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoadingPage()));
  }
}
