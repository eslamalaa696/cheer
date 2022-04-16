// ignore_for_file: dead_null_aware_expression
// To parse this JSON data, do
//
//     final test = testFromMap(jsonString);

import 'dart:convert';

class Test {
  Test({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.tags,
    required this.reactions,
  });

  final int id;
  final String title;
  final String body;
  final int userId;
  final List<String> tags;
  final int reactions;

  Test copyWith({
    required int id,
    required String title,
    required String body,
    required int userId,
    required List<String> tags,
    required int reactions,
  }) =>
      Test(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        userId: userId ?? this.userId,
        tags: tags ?? this.tags,
        reactions: reactions ?? this.reactions,
      );

  factory Test.fromJson(String str) => Test.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Test.fromMap(Map<String, dynamic> json) => Test(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        reactions: json["reactions"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "reactions": reactions,
      };
}

List<Test> decodeTestsFromJson(String str) => List<Test>.from(
      json.decode(str)["posts"].map(
            (item) => Test.fromMap(
              item,
            ),
          ),
    );
