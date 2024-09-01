import 'dart:convert';

import 'package:http/http.dart' as http;

class YHttpClient {
  static const String _baseUrl = "https//:replace with your Api key";

  static Future<Map<String, dynamic>> get(String endPoint) async {
    final http.Response response =
        await http.get(Uri.parse("$_baseUrl/$endPoint"));
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(
      String endPoint, dynamic data) async {
    final http.Response response = await http.post(
        Uri.parse("$_baseUrl/$endPoint"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data));
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> put(String endPoint, dynamic data) async {
    final http.Response response = await http.put(
        Uri.parse("$_baseUrl/$endPoint"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data));
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String endPoint) async {
    final http.Response response =
        await http.delete(Uri.parse("$_baseUrl/$endPoint"));
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load Data : ${response.statusCode}");
    }
  }
}
