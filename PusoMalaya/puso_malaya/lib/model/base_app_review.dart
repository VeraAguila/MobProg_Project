import 'package:uuid/uuid.dart';

const uid = Uuid();

class BaseAppReview {
  BaseAppReview({
    required this.userId,
    required this.movieId,
    required this.content,
    required this.rating,
    this.likeCount,
    this.spoilerWarning,
    this.isEdited,
  }) : SK = 'R#${uid.v4()}';  

  BaseAppReview.fromData({
    required this.SK,
    required this.userId,
    required this.movieId,
    required this.content,
    required this.rating,
    this.likeCount,
    this.spoilerWarning,
    this.isEdited,
  });

  final String SK;
  final String userId;
  final String movieId;
  final String content;
  final String rating;
  final String? likeCount;
  final bool? spoilerWarning;
  final bool? isEdited;

  Map<String, dynamic> toJson() {
    return {
      'SK': SK,
      'userId': userId,
      'movieId': movieId,
      'content': content,
      'rating': rating,
      'likeCount': likeCount,
      'spoilerWarning': spoilerWarning,
      'isEdited': isEdited,
    };
  }

  factory BaseAppReview.fromJson(Map<String, dynamic> json) {
    return BaseAppReview.fromData(
      SK: json['SK'] ?? '',
      userId: json['userId'] ?? '',
      movieId: json['movieId'] ?? '',
      content: json['content'] ?? '',
      rating: json['rating'] ?? '',
      likeCount: json['likeCount'] ?? '0',
      spoilerWarning: json['spoilerWarning'] ?? false,
      isEdited: json['isEdited'] ?? false,  
    );
  }
}
