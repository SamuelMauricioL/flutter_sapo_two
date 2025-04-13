part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object?> get props => [];
}

class PostsLoadPosts extends PostsEvent {}

class PostsLoadMorePosts extends PostsEvent {}

class PostsLikePost extends PostsEvent {
  const PostsLikePost(this.postId);
  // Changed class name
  final String postId;

  @override
  List<Object?> get props => [postId];
}

class PostsDislikePost extends PostsEvent {
  const PostsDislikePost(this.postId);
  // Changed class name
  final String postId;

  @override
  List<Object?> get props => [postId];
}
