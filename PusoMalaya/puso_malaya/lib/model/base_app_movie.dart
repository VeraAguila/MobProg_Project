import 'package:uuid/uuid.dart';

const uid = Uuid();

class BaseAppMovie {
  BaseAppMovie({
    required this.PK,
    required this.SK,
    required this.title,
    required this.releaseDate,
    required this.director,
    required this.cast,
    required this.genres,
    required this.synopsis,
    this.imdbId,
    this.s3Image,
    this.averageRating,
    this.reviewCount,
  });  

  BaseAppMovie.fromData({
    required this.PK,
    required this.SK,
    required this.title,
    required this.releaseDate,
    required this.director,
    required this.cast,
    required this.genres,
    required this.synopsis,
    this.s3Image,
    this.imdbId,
    this.averageRating,
    this.reviewCount,
  });

  final String PK;
  final String SK;
  final String title;
  final String releaseDate;
  final String director;
  final List<String> cast;
  final List<String> genres;
  final String synopsis;
  final String? s3Image;
  final String? imdbId;
  final String? averageRating;
  final int? reviewCount;

  Map<String, dynamic> toJson() {
    return {
      'PK': PK,
      'SK': SK,
      'title': title,
      'releaseDate': releaseDate,
      'director': director,
      'cast': cast,
      's3Image': s3Image,
      'genres': genres,
      'synopsis': synopsis,
      'imdbId': imdbId,
      'averageRating': averageRating,
      'reviewCount': reviewCount,
    };
  }

  factory BaseAppMovie.fromJson(Map<String, dynamic> json) {
    return BaseAppMovie.fromData(
      PK: json['PK'] ?? '',
      SK: json['SK'] ?? '',
      title: json['title'] ?? '',
      releaseDate: json['releaseDate'] ?? '',
      director: json['director'] ?? '',
      cast: List<String>.from(json['cast'] ?? []),
      genres: List<String>.from(json['genres'] ?? []),
      s3Image: json['s3Image'] ?? '',
      synopsis: json['synopsis'] ?? '',
      imdbId: json['imdbId'],
      averageRating: json['averageRating'],
      reviewCount: json['reviewCount'],
    );
  }
}
