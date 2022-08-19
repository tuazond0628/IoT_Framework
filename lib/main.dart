import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:iot_framework/loading_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  if (kIsWeb) {
    // running on the web!
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyA34d9UDpZvk2ARLNKJ2U4ZNc4OyaQ4qYg',
            authDomain: 'iot-framework-e5959.firebaseapp.com',
            databaseURL:
                'https://iot-framework-e5959-default-rtdb.asia-southeast1.firebasedatabase.app',
            projectId: 'iot-framework-e5959',
            storageBucket: 'iot-framework-e5959.appspot.com',
            messagingSenderId: '648439518891',
            appId: '1:648439518891:web:81e8bda5254025305289ee',
            measurementId: 'G-31J15Z5SZE'));
  } else {
    // running on mobile (Android or iPhone)
    await Firebase.initializeApp();
  }
  // FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      // themeMode: ThemeMode.light,
      // theme: FlexColorScheme.light(scheme: FlexScheme.espresso).toTheme,
      // darkTheme: FlexColorScheme.light(scheme: FlexScheme.espresso).toTheme,
      home: const LoadingPage(),
    );
  }
}
