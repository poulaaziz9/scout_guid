import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scout_guid/main.dart';
import 'package:scout_guid/menu_frame.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primaryColor: Colors.white,

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: menu_frame(),
    );
  }
}