// ignore_for_file: dead_null_aware_expression
// To parse this JSON data, do
//
//     final review = reviewFromMap(jsonString);

import 'dart:convert';

class Review {
  Review({
    required this.id,
    required this.body,
    required this.ReviewId,
    required this.user,
  });

  final int id;
  final String body;
  final String ReviewId;
  final User user;

  Review copyWith({
    required int id,
    required String body,
    required String ReviewId,
    required User user,
  }) =>
      Review(
        id: id ?? this.id,
        body: body ?? this.body,
        ReviewId: ReviewId ?? this.ReviewId,
        user: user ?? this.user,
      );

  factory Review.fromJson(String str) => Review.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Review.fromMap(Map<String, dynamic> json) => Review(
        id: json["id"],
        body: json["body"],
        ReviewId: json["ReviewId"].toString(),
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "body": body,
        "ReviewId": ReviewId,
        "user": user.toMap(),
      };
}

class User {
  User({
    required this.id,
    required this.username,
  });

  final int id;
  final String username;

  User copyWith({
    required int id,
    required String username,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
      };
}

List<Review> decodeReviewsFromJson(String str) => List<Review>.from(
      json.decode(str)["comments"].map(
            (item) => Review.fromMap(
              item,
            ),
          ),
    );
