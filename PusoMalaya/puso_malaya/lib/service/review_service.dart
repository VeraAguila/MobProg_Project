import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:puso_malaya/model/base_app_review.dart';

var apiUrl = '17bckriqx0.execute-api.ap-southeast-2.amazonaws.com';
var stage = '/prod';
var systemId = 'BASE_APP';

class ReviewService {
  Future<List<BaseAppReview>?> getReview({
    required BuildContext context,
  }) async {
    final url = Uri.https(apiUrl, '$stage/reviews');

    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "system-id": systemId,
      },
    );

    if (!context.mounted) {
      return null;
    }

    if (response.statusCode >= 400) {
      final Map<String, dynamic>? responseBody = jsonDecode(
        response.body,
      );

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Failed to fetch Review.',
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

    final List<dynamic> jsonList = json.decode(response.body);

    return jsonList.map((item) => BaseAppReview.fromJson(item)).toList();
  }
}