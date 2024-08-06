import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/body/userParams.dart';
import 'package:card_reg/api/api.dart';

class ApiCall {
  static const baseUrl = Endpoint.registerUser;
  Future<User> submitPhoneNumber(String phoneNumber) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {'phoneNumber': phoneNumber},
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Invalid phone number");
    }
  }
}
