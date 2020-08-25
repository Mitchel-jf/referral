import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referral/services/sp_service.dart';

import 'pages/dashboard/dashboard_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SPService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        buttonColor: Colors.green,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardPage(),
    );
  }
}
