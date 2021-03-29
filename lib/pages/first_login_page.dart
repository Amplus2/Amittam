import 'package:amittam/constants.dart';
import 'package:flutter/material.dart';

class FirstLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstLoginPageState();
}

class _FirstLoginPageState extends State<FirstLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APP_NAME)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [],
        ),
      ),
    );
  }
}
