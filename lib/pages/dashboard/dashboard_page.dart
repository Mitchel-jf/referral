import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/login_page.dart';
import '../withdrawal/wprovider.dart';

part 'welcome_widget.dart';
part 'balances_widget.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: CircleAvatar(child: Icon(Icons.person)),
          onPressed: () => Navigator.push(
              context, CupertinoPageRoute(builder: (context) => LoginPage())),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Welcome(),
          ),
          Expanded(
            flex: 2,
            child: Balances(),
          ),
          Expanded(
            child: Center(
              child: Hero(
                tag: 'button',
                child: RaisedButton(
                  child: Text('Withdraw'),
                  onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              ChangeNotifierProvider<WProvider>(
                                create: (_) => WProvider(),
                                child: WithdrawalPage(),
                              ))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
