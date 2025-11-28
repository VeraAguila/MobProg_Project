import 'package:uuid/uuid.dart';

const uid = Uuid();

class BaseAppReview {
  BaseAppReview({
    required this.SK,
    required this.useId,
    required this.movieId,
    required this.content,
    required this.rating,
    this.likeCount,
    this.spoilerWarning,
    this.isEdited,
  });  

  BaseAppReview.fromData({
    required this.SK,
    required this.useId,
    required this.movieId,
    required this.content,
    required this.rating,
    this.likeCount,
    this.spoilerWarning,
    this.isEdited,
  });

  final String SK;
  final String useId;
  final String movieId;
  final String content;
  final String rating;
  final int? likeCount;
  final String? spoilerWarning;
  final String? isEdited;

  Map<String, dynamic> toJson() {
    return {
      'SK': SK,
      'useId': useId,
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
      useId: json['useId'] ?? '',
      movieId: json['movieId'] ?? '',
      content: json['content'] ?? '',
      rating: json['rating'] ?? '',
      likeCount: json['likeCount'] ?? '',
      spoilerWarning: json['spoilerWarning'] ?? '',
      isEdited: json['isEdited'] ?? '',
    );
  }
}
