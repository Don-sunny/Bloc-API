import 'dart:convert';
import 'dart:developer';

import 'package:bloc_api/feature/post/bloc/post_bloc.dart';
import 'package:bloc_api/feature/post/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  static Future<List<PostUiModel>> fetchPost() async {
    var client = http.Client();
    List<PostUiModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        PostUiModel post =
            PostUiModel.fromJson(result[i] as Map<String, dynamic>);
        posts.add(post);
      }

      return posts;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<bool> addPost() async {
    var client = http.Client();
    List<PostUiModel> posts = [];
    try {
      var response = await client
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
        "title": "Don Sunny",
        "body": "Don is a flutter developer",
        "userId": "34",
      });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
