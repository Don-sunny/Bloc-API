import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_api/feature/post/model/post_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostState> emit) async {
    print('api caled');
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

      print(posts);
      emit(PostFetchingSuccessful(posts: posts));
    } catch (e) {
      log(e.toString());
    }
  }
}
