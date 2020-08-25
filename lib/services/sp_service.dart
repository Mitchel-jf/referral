import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPService with ChangeNotifier {
  SharedPreferences sp;

  SPService() {
    init();
  }

  void init() async {
    sp = await SharedPreferences.getInstance();
    notifyListeners();
  }
}
