// To parse this JSON data, do
//
//     final PostUiModel = welcomeFromJson(jsonString);

import 'dart:convert';

List<PostUiModel> postUiModelFromJson(String str) => List<PostUiModel>.from(
    json.decode(str).map((x) => PostUiModel.fromJson(x)));

String postUiModelToJson(List<PostUiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostUiModel {
  int userId;
  int id;
  String title;
  String body;

  PostUiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostUiModel.fromJson(Map<String, dynamic> json) => PostUiModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
