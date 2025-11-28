import 'package:uuid/uuid.dart';

const uid = Uuid();

class BaseAppUser {
  BaseAppUser({
    required this.username,
    required this.password,
    required this.email,
  }) : uuid = uid.v4(),
       createdAt = DateTime.now().toIso8601String(),
       SK = 'U#${uid.v4()}';

  BaseAppUser.fromData({
    required this.uuid,
    required this.username,
    required this.password,
    required this.email,
    required this.createdAt,
    required this.SK,
  });

  final String uuid;
  final String createdAt;
  final String username;
  final String password;
  final String email;
  final String SK;

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'createdAt': createdAt,
      'username': username,
      'password': password,
      'email': email,
      'SK': SK,
    };
  }

  factory BaseAppUser.fromJson(Map<String, dynamic> json) {
    return BaseAppUser.fromData(
      uuid: json['uuid'] ?? uid.v4(),
      createdAt: json['createdAt'] ?? DateTime.now().toIso8601String(),
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      email: json['email'] ?? '',
      SK: json['SK'] ?? '',
    );
  }
}