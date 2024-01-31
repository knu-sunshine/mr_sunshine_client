import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  final String userName;
  final String userEmail;
  final String userId;

  User({
    required this.userName,
    required this.userEmail,
    required this.userId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userName: json["userName"],
        userEmail: json["userEmail"],
        userId: json["userId"],
      );
}
