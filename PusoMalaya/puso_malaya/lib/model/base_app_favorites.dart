import 'package:uuid/uuid.dart';

const uid = Uuid();

class BaseAppFavorite {
  BaseAppFavorite({
    required this.SK,
    required this.userId,
    required this.movieId,
    this.addedAt,
  });  

  BaseAppFavorite.fromData({
    required this.SK,
    required this.userId,
    required this.movieId,
    this.addedAt,
  });

  final String SK;
  final String userId;
  final String movieId;
  final String? addedAt;

  Map<String, dynamic> toJson() {
    return {
      'SK': SK,
      'userId': userId,
      'movieId': movieId,
      'addedAt': addedAt,
    };
  }

  factory BaseAppFavorite.fromJson(Map<String, dynamic> json) {
    return BaseAppFavorite.fromData(
      SK: json['SK'] ?? '',
      userId: json['userId'] ?? '',
      movieId: json['movieId'] ?? '',
      addedAt: json['addedAt'] ?? '',
    );
  }
}
