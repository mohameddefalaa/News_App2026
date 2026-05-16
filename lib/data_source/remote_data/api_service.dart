import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/data_source/remote_data/api_cpnfig.dart';

class ApiService {
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
