import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/data_source/remote_data/api_cpnfig.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  ApiService._internal() {} //{} تم انشاء الكنستركتور لأول مره
  factory ApiService() {
    return _instance;
  }

  Future<dynamic> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      var url = Uri.https(ApiCpnfig.baseurl, 'v2/$endpoint', {
        "apiKey": ApiCpnfig.apiKey,
        ...?params,
      });
      print(url);

      final http.Response response = await http.get(url);

      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw Exception("failed to mload data ");
    }
  }
}
