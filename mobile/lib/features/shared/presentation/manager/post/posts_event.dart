part of 'posts_bloc.dart';

abstract class PostsEvent {}


class GetCurrentUserPostsEvent extends PostsEvent {}

class GetUserPostsEvent extends PostsEvent {
  final String userId;

  GetUserPostsEvent(this.userId);
}