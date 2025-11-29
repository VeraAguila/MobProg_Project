import 'dart:convert';

import 'package:puso_malaya/model/base_app_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var apiUrl = 'ccfh9odail.execute-api.ap-southeast-2.amazonaws.com';
var stage = '/dev';

class LoginService {
  Future<BaseAppUser?> loginRequest({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    final uri = Uri.https(
      apiUrl,
      '$stage/users/login',
      // {
      //   'username': username.trim(),
      //   'password': password.trim(),
      // },
    );

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username.trim(),
        'password': password.trim(),
      }),
    );

    if (!context.mounted) {
      return null;
    }
    List<dynamic> data = jsonDecode(
      response.body,
    );
    Map<String, dynamic> user = data[0];
    // final Map<String, dynamic>? responseBody = jsonDecode(
    //   response.body,
    // );
    print('RESPONSE BODY: ${response.body}');
    if (response.statusCode >= 400) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Login failed.',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            //responseBody != null
            //  ? responseBody['message']
            //: 'Internal Server Error',
            'error',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );

      return null;
    }

    BaseAppUser loginUser = BaseAppUser.fromJson(user);
    return loginUser;
  }

  Future<String?> register({
    required BuildContext context,
    required String username,
    required String password,
    required String email,
  }) async {
    final uri = Uri.https(
      apiUrl,
      '$stage/users',
    );

    BaseAppUser newUser = BaseAppUser(
      username: username,
      password: password,
      email: email,
    );

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(newUser.toJson()),
    );

    if (!context.mounted) {
      return null;
    }

    final Map<String, dynamic>? responseBody = jsonDecode(
      response.body,
    );

    if (response.statusCode >= 400) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Registration failed.',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            responseBody != null
                ? responseBody['message']
                : 'Internal Server Error',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );

      return null;
    }

    return responseBody!['message'];
  }
}
