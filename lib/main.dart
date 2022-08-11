import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iot_framework/loading_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // // whenever your initialization is completed, remove the splash screen:
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
