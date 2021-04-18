import 'package:amittam/constants.dart';
import 'package:amittam/pages/first_login_page.dart';
import 'package:amittam/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'encryptionlib.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Prefs.initialize();
  runApp(MainApp());
}

late void Function() rebuildApp;

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    rebuildApp = () => setState(() {});
    return MaterialApp(
      title: APP_NAME,
      theme: prefs.themeData,
      home: prefs.firstLogin ? FirstLoginPage() : HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
