// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapo_two/di/injection_container.dart';
import 'package:flutter_sapo_two/posts/bloc/posts_bloc.dart';
import 'package:flutter_sapo_two/posts/widgets/post_list.dart';
import 'package:st_post_domain/st_post_domain.dart';
import 'package:st_ui/st_ui.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(
        getPostsUseCase: Get.it<GetPostsUseCase>(),
        likePostUseCase: Get.it<LikePostUseCase>(),
        dislikePostUseCase: Get.it<DislikePostUseCase>(),
      )..add(PostsLoadPosts()),
      child: const PostsBody(),
    );
  }
}

class PostsBody extends StatelessWidget {
  const PostsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostsBloc, PostsState>(
      listener: (context, state) {
        if (state is PostActionError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            return switch (state) {
              PostsLoading() => const StLoadingIndicator(),
              PostsLoaded(
                :final List<Post> posts,
                :final bool hasReachedMax,
              ) =>
                PostListView(posts: posts),
              PostsError(:final String message) =>
                StErrorMessage(message: message),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}
