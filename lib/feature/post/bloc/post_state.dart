part of 'post_bloc.dart';

@immutable
abstract class PostState {}

abstract class PostActionState extends PostState {}

class PostInitial extends PostState {}

class PostFetchingSuccessful extends PostState {
  final List<PostUiModel> posts;

  PostFetchingSuccessful({
    required this.posts,
  });
}
