import 'package:amittam/constants.dart';
import 'package:amittam/uilib.dart';
import 'package:flutter/material.dart';

class FirstLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstLoginPageState();
}

class _FirstLoginPageState extends State<FirstLoginPage> {
  final pwField = CustomFormField(label: 'Password');
  final pwTextField = CustomFormField(label: 'Confirm password');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APP_NAME)),
      body: CustomPageContainer(
        context,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              pwField.flutter(obscureText: true),
              pwTextField.flutter(obscureText: true),
            ],
          ),
        ),
      ),
    );
  }
}
