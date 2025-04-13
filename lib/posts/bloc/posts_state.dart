part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object?> get props => [];
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  const PostsLoaded({required this.posts, this.hasReachedMax = false});
  final List<Post> posts;
  final bool hasReachedMax;

  @override
  List<Object?> get props => [posts, hasReachedMax];

  PostsLoaded copyWith({
    List<Post>? posts,
    bool? hasReachedMax,
  }) {
    return PostsLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class PostsError extends PostsState {
  const PostsError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class PostActionError extends PostsState {
  const PostActionError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
