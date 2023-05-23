import 'dart:convert';

import 'package:get/get.dart';
import 'package:hire2_master/constants.dart';
import 'package:http/http.dart' as http;

import '../model/http_exception.dart';

class MyController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool hasData = false.obs;
  RxMap<String, dynamic> data = <String, dynamic>{}.obs;

  Future<dynamic> apiGet() async {
    final uri = Uri.parse(Constants.url);
    try {
      isLoading.value = true;
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        data.value = json.decode(response.body);
        hasData.value = true;
      } else {
        throw HttpException('Error Occurred');
      }
    } catch (error) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
