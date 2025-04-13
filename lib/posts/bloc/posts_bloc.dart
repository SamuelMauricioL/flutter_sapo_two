import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:st_post_domain/st_post_domain.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({
    required GetPostsUseCase getPostsUseCase,
    required LikePostUseCase likePostUseCase,
    required DislikePostUseCase dislikePostUseCase,
  })  : _getPostsUseCase = getPostsUseCase,
        _likePostUseCase = likePostUseCase,
        _dislikePostUseCase = dislikePostUseCase,
        super(PostsInitial()) {
    on<PostsLoadPosts>(_onLoadPosts);
    on<PostsLoadMorePosts>(_onLoadMorePosts);
    on<PostsLikePost>(_onLikePost);
    on<PostsDislikePost>(_onDislikePost);
  }

  final GetPostsUseCase _getPostsUseCase;
  final LikePostUseCase _likePostUseCase;
  final DislikePostUseCase _dislikePostUseCase;

  Future<void> _onLoadPosts(
    PostsLoadPosts event,
    Emitter<PostsState> emit,
  ) async {
    emit(PostsLoading());
    final result = await _getPostsUseCase(const GetPostsParams(limit: 30));
    result.when(
      ok: (posts) => emit(
        PostsLoaded(
          posts: posts,
          hasReachedMax: posts.length < 30,
        ),
      ),
      err: (failure) => emit(PostsError(message: failure.message)),
    );
  }

  Future<void> _onLoadMorePosts(
    PostsLoadMorePosts event,
    Emitter<PostsState> emit,
  ) async {
    if (state is PostsLoaded) {
      final currentState = state as PostsLoaded;
      if (!currentState.hasReachedMax) {
        final result = await _getPostsUseCase(
          GetPostsParams(
            limit: 30,
            lastDocumentId: currentState.posts.last.id,
          ),
        );
        result.when(
          ok: (newPosts) => emit(
            PostsLoaded(
              posts: currentState.posts + newPosts,
              hasReachedMax: newPosts.length < 30,
            ),
          ),
          err: (failure) => emit(PostsError(message: failure.message)),
        );
      }
    }
  }

  Future<void> _onLikePost(
    PostsLikePost event,
    Emitter<PostsState> emit,
  ) async {
    if (state is PostsLoaded) {
      final currentState = state as PostsLoaded;
      final result =
          await _likePostUseCase(LikePostParams(postId: event.postId));
      result.when(
        ok: (_) {
          final updatedPosts = currentState.posts.map((post) {
            if (post.id == event.postId) {
              return post.copyWith(likes: post.likes + 1);
            }
            return post;
          }).toList();
          emit(currentState.copyWith(posts: updatedPosts));
        },
        err: (failure) => emit(
          PostActionError(message: failure.message),
        ),
      );
    }
  }

  Future<void> _onDislikePost(
    PostsDislikePost event,
    Emitter<PostsState> emit,
  ) async {
    if (state is PostsLoaded) {
      final currentState = state as PostsLoaded;
      final result =
          await _dislikePostUseCase(DislikePostParams(postId: event.postId));
      result.when(
        ok: (_) {
          final updatedPosts = currentState.posts.map((post) {
            if (post.id == event.postId) {
              return post.copyWith(dislikes: post.dislikes + 1);
            }
            return post;
          }).toList();
          emit(currentState.copyWith(posts: updatedPosts));
        },
        err: (failure) => emit(
          PostActionError(message: failure.message),
        ),
      );
    }
  }
}
