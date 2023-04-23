import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class NodeProvider extends ChangeNotifier {
  final String baseUrl = "https://localhost:5000/api";

  Future<Map<String, dynamic>> createUser(
      String name, String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/users'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
        }));

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<Map<String, dynamic>> authenticateUser(
      String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/authenticate'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to authenticate user');
    }
  }
}
