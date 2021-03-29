import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void push(BuildContext context, Widget newPage) => Navigator.of(context)
    .push(MaterialPageRoute(builder: (context) => newPage));

void pushReplacement(BuildContext context, Widget newPage) =>
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => newPage));

class CustomFormField {
  CustomFormField({this.onChange});

  final void Function(String)? onChange;
  final TextEditingController controller = TextEditingController();
}
