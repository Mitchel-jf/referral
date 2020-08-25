import 'package:flutter/material.dart';

class KeyValue extends StatelessWidget {
  final Color color;
  final String stringKey, value;

  KeyValue(this.stringKey, this.value, {this.color});

  @override
  Widget build(BuildContext context) {
    const keyStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    var valueStyle = TextStyle(
      fontSize: 16,
      color: color,
    );
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(text: '$stringKey:', style: keyStyle),
          TextSpan(text: '  $value\n', style: valueStyle),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
