import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelText;

  InputField({this.labelText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
