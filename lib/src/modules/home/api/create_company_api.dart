import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> createCompany(BuildContext context, String companyName, email,
    password, phoneNumber) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST', Uri.parse('http://139.59.35.127/apex-dmit/public/api/company/'));
  request.body = json.encode({
    "company_name": companyName,
    "email": email,
    "password": password,
    "phone": phoneNumber
  });
  request.headers.addAll(headers);

  await request.send().then((response) async {
    if (response.statusCode == 201) {
      await response.stream.bytesToString().then((value) {
        final msg = json.decode(value)['status_message'];
        debugPrint(msg);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$msg')),
        );
      });
    } else {
      await response.stream.bytesToString().then((value) {
        final msg = json.decode(value)['status_message'];
        debugPrint(msg);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$msg')),
        );
      });
    }
  });
}
