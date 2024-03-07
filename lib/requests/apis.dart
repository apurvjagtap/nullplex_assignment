import 'dart:convert';

import 'package:http/http.dart' as http;

class Apis {
  static Future<http.Response?> signUpApiRequest(
      {name, password, phoneNumber, id}) async {
    final String url = 'http://restsf.nullplex.co.in/api/register';

    try {
      Map<String, dynamic> requestData = {
        'name': name,
        'mobile': phoneNumber,
        'password': password,
        'password_confirmation': password,
        'deviceid': id,
      };

      String requestBody = jsonEncode(requestData);

      final http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<http.Response?> signInApiRequest({phone, password, id}) async {
    final String url = 'http://restsf.nullplex.co.in/api/login';

    try {
      Map<String, dynamic> requestData = {
        'mobile': phone,
        'password': password,
        'deviceid': id,
      };

      String requestBody = jsonEncode(requestData);

      final http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      return response;
    } catch (e) {
      return null;
    }
  }
}
