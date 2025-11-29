import 'dart:convert';

import 'package:puso_malaya/model/base_app_favorites.dart';
import 'package:puso_malaya/model/base_app_movie.dart';
import 'package:puso_malaya/model/base_app_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var apiUrl = 'ccfh9odail.execute-api.ap-southeast-2.amazonaws.com';
var stage = '/dev';

class FavoriteService {
  Future<List<BaseAppMovie>?> viewFavorites({
    required BuildContext context,
    required String userId,
  }) async {
    final uri = Uri.https(
      apiUrl,
      '$stage/favorites/view_favorites'
    );

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'userId': userId.trim(),
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
            'Failed to fetch movies.',
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
    final List<BaseAppMovie> movies = jsonList.map((item) => BaseAppMovie.fromJson(item)).toList();

    return movies;
    // return jsonList.map((item) => BaseAppFavorite.fromJson(item)).toList();
  }
}
