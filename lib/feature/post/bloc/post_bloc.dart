import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_api/feature/post/model/post_model.dart';
import 'package:bloc_api/feature/post/repose/post_repo.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(PostFecthingLoadingState());

    List<PostUiModel> posts = await PostRepo.fetchPost();

    emit(PostFetchingSuccessful(posts: posts));
  }

  FutureOr<void> postAddEvent(
      PostAddEvent event, Emitter<PostState> emit) async {
    bool success = await PostRepo.addPost();
    print(success);
    if (success) {
      emit(PostAdditionSuccessState());
    } else {
      emit(PostAdditionErrorState());
    }
  }
}
