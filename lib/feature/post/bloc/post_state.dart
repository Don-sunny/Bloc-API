part of 'post_bloc.dart';

@immutable
abstract class PostState {}

abstract class PostActionState extends PostState {}

class PostInitial extends PostState {}

class PostFecthingLoadingState extends PostState {}

class PostFecthingErrorState extends PostState {}

class PostFetchingSuccessful extends PostState {
  final List<PostUiModel> posts;

  PostFetchingSuccessful({
    required this.posts,
  });
}

class PostAdditionSuccessState extends PostActionState {}

class PostAdditionErrorState extends PostActionState {}
