import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'payment_status.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text('Payment'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Complete your Registartion'),
            Text('with'),
            Text('#2,000'),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Pay now'),
              onPressed: () => Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => PaymentStatus())),
            ),
          ],
        ),
      ),
    );
  }
}
