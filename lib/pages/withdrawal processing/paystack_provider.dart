import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:referral/pages/withdrawal/key_value_widget.dart';

part 'success_page.dart';
part 'failed_page.dart';
part 'withdrawal_processing_page.dart';

class PayStackProvider with ChangeNotifier {
  PayStackProvider() {
    mockWork();
  }
  String recepient;
  String trUrl = 'https://api.paystack.co/transferrecipient';
  String itUrl = 'https://api.paystack.co/transfer';
  String ftUrl = 'https://api.paystack.co/transfer';
  Map<String, dynamic> headers = {
    //'Authorization': 'Bearer sk_live_8a913a5dc15fb2dcc48d749dd5cd7b8295e62a5a',
    'Authorization': 'Bearer sk_test_938f8f15ee999d47088b6a7a8ed949d12fa0ad65',
    'Content-Type': 'application/json',
  };
  Map<String, dynamic> body = {
    'type': 'nuban',
    'currency': 'NGN',
  };
  Map<String, dynamic> body2 = {
    'source': 'balance',
    'reason': 'Withdrawal for Gagner Referral',
  };
  Map<String, dynamic> body3 = {};
  Progress progress;

  String date() {
    var now = DateTime.now();
    String year = now.year.toString();
    String month = now.month.toString();
    String day = now.day.toString();
    String hour = now.hour.toString();
    String minute = now.minute.toString();

    return '$hour:$minute  $day-$month-$year';
  }

  void mockWork() async {
    progress = Progress.loading;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    progress = Progress.success;
    notifyListeners();
  }

  void createTransferRecepient() async {
    body['name'] = 'Febechukwu Mitchell';
    body['account_number'] = '0096363800';
    body['bank_code'] = '063';

    var res = await http.post(trUrl, headers: headers, body: body);
    Map<String, dynamic> response = json.decode(res.body);
    Map<String, dynamic> data = response['data'];
    String code = data['recipient_code'];
    initiateTransfer(code);
  }

  void initiateTransfer(String code) async {
    body2['recipient'] = code;
    body2['amount'] = '20000';

    var res = await http.post(itUrl, headers: headers, body: body2);
    Map<String, dynamic> response = json.decode(res.body);
    Map<String, dynamic> data = response['data'];
    String reference = data['reference'];
    String transferCode = data['transfer_code'];
    verifyTransfer(reference);
  }

  void verifyTransfer(String reference) async {
    var res = await http.get('$ftUrl/$reference', headers: headers);
  }
}

enum Progress { loading, success, failed }
