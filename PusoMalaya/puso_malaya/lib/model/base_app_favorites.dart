import 'package:uuid/uuid.dart';

const uid = Uuid();

class BaseAppFavorite {
  BaseAppFavorite({
    required this.movieId,
    required this.SK,
    required this.PK,
    required this.userId,
  });  

  BaseAppFavorite.fromData({
    required this.movieId,
    required this.SK,
    required this.PK,
    required this.userId,
  });

  final String movieId;
  final String SK;
  final String PK;
  final String userId;

  Map<String, dynamic> toJson() {
    return {
      'movieId': movieId,
      'SK': SK,
      'PK': PK,
      'userId': userId,
    };
  }

  factory BaseAppFavorite.fromJson(Map<String, dynamic> json) {
    return BaseAppFavorite.fromData(
      movieId: json['movieId'] ?? '',
      SK: json['SK'] ?? '',
      PK: json['PK'] ?? '',
      userId: json['userId'] ?? '',
    );
  }
}
