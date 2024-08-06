import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/body/userParams.dart';
import 'package:card_reg/api/api.dart';
import 'api_calls/api_call.dart';

class UserApi {
  static const baseUrl = Endpoint.registerUser;
  final ApiCall apiCall = ApiCall();

  Future<User> submitPhoneNumber(String phoneNumber) {
    return apiCall.submitPhoneNumber(phoneNumber);
  }
}
