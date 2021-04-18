import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void push(BuildContext context, Widget newPage) => Navigator.of(context)
    .push(MaterialPageRoute(builder: (context) => newPage));

void pushReplacement(BuildContext context, Widget newPage) =>
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => newPage));

class CustomPageContainer extends Container {
  CustomPageContainer(
    BuildContext context, {
    Widget? child,
    EdgeInsetsGeometry? padding,
  }) : super(
          padding: padding,
          child: InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => FocusScope.of(context).unfocus(),
            child: child,
          ),
        );
}

class CustomFormField {
  CustomFormField({this.onChange, this.label});

  final String? label;
  final void Function(String)? onChange;
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();

  Widget flutter({
    Widget? suffixIcon,
    bool obscureText = false,
  }) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        alignLabelWithHint: true,
      ),
    );
  }

  void focus() => focusNode.requestFocus();

  String getText() => controller.text;
}
