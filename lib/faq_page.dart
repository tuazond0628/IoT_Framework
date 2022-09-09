import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/models/appbar.dart';

class FrequentlyAskQuestionsPage extends StatefulWidget {
  const FrequentlyAskQuestionsPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<FrequentlyAskQuestionsPage> createState() => _ConveniencePageState();
}

class _ConveniencePageState extends State<FrequentlyAskQuestionsPage> {
  List<Users> list = [
    Users(
        name: '1. What is IoT Automation Framework App?',
        subTitle:
            'The App is a library of ready-to-install automation routines design for Alexa smart home users to accelerate the automation of IoT devices.'),
    Users(
        name: '2. How to use the IoT Automation Framework App?',
        subTitle:
            '1. The user of the App must be an Alexa App smart home user with an IoT devices already setup and installed. '
            '\n2. Depending on the user needs, '
            'simply search and filter from list of automation routines and by clicking the "Get" button. \n\nMobile App Version: Automatically open an Alexap App window stating '
            '"You have received an Alexa Routine". \n\nWeb App Version: Automatically generate a QR code which can be scan by a camera phone.'),
    Users(
        name:
            '3. What IoT device must a user have to run the automated routines?',
        subTitle:
            '1. The user must at least have a triggering devices installed in their Alexa App. \n\nSee the "Triggers" section of the Framework App for the list of triggering devices.'
            '\n\n2. Each automation routine is provided with information to help user understand its purpose and the devices it uses to operate.'),
    Users(
        name:
            '4. Can the IoT Automation Framework App be used without the Alexa App installed?',
        subTitle:
            'The App can run even without the Alexa App, but to use its built-in automation routines, an Alexa app is required to be installed on the same mobile device.'),
    Users(
        name: '5. How to enable the automation routines in the Alexa App?',
        subTitle: '1. Click View Routine in the Alexa App. '
            '\n2. Look for options in yellow text, which shows the you need to make a selection to complete the setup.'
            '\n3. Click Save to enable the routine.'
            '\n\nNote: Some options for actions your devices cannot perform, or devices you dont own, will be in yellow text. To enable a routine, at least one action in the routine has to be correctly set up.'),
    // Users(
    //     name:
    //         '6. Can the IoT Automation Framework App be used without internet connection?',
    //     subTitle:
    //         'The data in the app is store in a realtime database and to access this data, the App must be online. An automatic pop-up will be displayed in the app once internet connection is lost. '),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (kIsWeb) // running on the web!
          ? AppBar(
              backgroundColor: const Color(0xFF1D63A3),
              elevation: 0,
              centerTitle: true,
              title: const Text('Frequently Ask Questions',
                  style: TextStyle(
                    fontFamily: 'Proxima',
                    fontSize: 23,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black87,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  )))
          : BaseAppBar(
              title: const Text('Frequently Ask Questions',
                  style: TextStyle(
                    fontFamily: 'Proxima',
                    fontSize: 23,
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
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Color(0xFFF8B7CD),
                Color(0xFFF6D2E0),
                Color(0xFFC8E7F5),
                Color(0xFF67A3D9),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              // leading: const Icon(
                              //   Icons.question_answer_rounded,
                              //   color: Colors.white,
                              // ),
                              title: Text(
                                list[index].name,
                                style: const TextStyle(
                                  fontFamily: 'Proxima',
                                  color: Colors.black87,
                                  fontSize: (kIsWeb) // running on the web!
                                      ? 22
                                      : 18,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.white54,
                                      offset: Offset(5.0, 5.0),
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: Text(
                                list[index].subTitle,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontFamily: 'Proxima',
                                  color: Colors.black87,
                                  fontSize: (kIsWeb) // running on the web!
                                      ? 20
                                      : 16,
                                ),
                              ),
                            );
                          }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Users {
  String name, subTitle;

  Users({required this.name, required this.subTitle});
}
