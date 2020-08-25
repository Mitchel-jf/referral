import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:referral/pages/withdrawal%20processing/paystack_provider.dart';
import 'dart:convert';

import '../../bank_model.dart';
import 'key_value_widget.dart';

part 'withdrawal_page.dart';

class WProvider with ChangeNotifier {
  WProvider() {
    value = banks[0];
  }
  Map<String, String> headers = {
    // 'Authorization': 'Bearer sk_live_8a913a5dc15fb2dcc48d749dd5cd7b8295e62a5a',
    'Authorization': 'Bearer sk_test_938f8f15ee999d47088b6a7a8ed949d12fa0ad65',
    'Content-Type': 'application/json',
  };
  var controller = TextEditingController();
  Bank value;
  Verify isVerified = Verify.unverified;
  bool show = false;
  String accName;
  final banks = <Bank>[
    Bank(name: 'Bank', code: '0'),
    Bank(name: 'Access Bank (Diamond)', code: '063'),
    Bank(name: 'First City Monument Bank', code: '214'),
    Bank(name: 'First Bank of Nigeria', code: '011'),
    Bank(name: 'Guaranty Trust Bank', code: '058'),
    Bank(name: 'United Bank for Africa', code: '033'),
    Bank(name: 'VFD', code: '566'),
    Bank(name: 'Zenith Bank', code: '057'),
  ];

  void onChange(Bank value) {
    this.value = value;
    value != banks[0] ? show = true : show = false;
    isVerified = Verify.unverified;
    notifyListeners();
  }

  void verify() async {
    isVerified = Verify.verifying;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    isVerified = Verify.verified;
    notifyListeners();
  }

  void resolveAccountNumber(String accountNumber, String bankCode) async {
    isVerified = Verify.verifying;
    notifyListeners();
    var res = await http.get(
      'https://api.paystack.co/bank/resolve?account_number='
      '$accountNumber&bank_code=$bankCode',
      headers: headers,
    );
    Map<String, dynamic> response = json.decode(res.body);
    Map<String, dynamic> data = response['data'];
    debugPrint('Acc: $accountNumber Code: $bankCode');
    debugPrint(data.toString());
    bool status = response['status'];
    if (status) {
      // if (status == 'true') {
      accName = data['account_name'];
      isVerified = Verify.verified;
      notifyListeners();
    } else {
      isVerified = Verify.unverified;
      notifyListeners();
    }
  }
}

enum Verify { verified, verifying, unverified }
