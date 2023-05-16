import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:company_list_app/src/modules/home/model/comapny_data_model.dart';

Future<List<Datum>?> getComapnyData() async {
  try {
    var request = http.Request(
        'GET', Uri.parse('http://139.59.35.127/apex-dmit/public/api/company/'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      debugPrint(body);
      return comapanyDataModelFromJson(body).companyList.data;
    } else {
      debugPrint(response.reasonPhrase);
      EasyLoading.showError(response.reasonPhrase!);
      return [];
    }
  } on SocketException catch (e) {
    EasyLoading.showError('No Internet Connection. $e');
    return [];
  } catch (e) {
    debugPrint(e.toString());
    EasyLoading.showError(e.toString());
    return [];
  }
}

final getComapnyDataProvider =
    FutureProvider<List<Datum>?>((ref) async {
  var data =  await getComapnyData();
  data!.reversed.toList();
  return data;
});
