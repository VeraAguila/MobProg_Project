import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:puso_malaya/model/base_app_review.dart';

var apiUrl = 'ccfh9odail.execute-api.ap-southeast-2.amazonaws.com';
var stage = '/dev';

class ReviewService {
  Future<List<BaseAppReview>?> getReview({
    required BuildContext context,
    required String userId,
  }) async {
    final url = Uri.https(apiUrl, '$stage/reviews/view_reviews');

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        'movieId': userId,
      }),
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

    final Map<String, dynamic> decoded = json.decode(response.body);

    final List<dynamic> jsonList = decoded['reviews'] ?? [];

    return jsonList.map((item) => BaseAppReview.fromJson(item)).toList();
  }

  Future<String?> addreview({
    required BuildContext context,
    required String userId,
    required String movieId,
    required String content,
    required String rating,
  }) async {
    final uri = Uri.https(
      apiUrl,
      '$stage/reviews',
    );

    BaseAppReview newReview = BaseAppReview(
      userId: userId,
      movieId: movieId,
      content: content,
      rating: rating,
    );

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(newReview.toJson()),
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