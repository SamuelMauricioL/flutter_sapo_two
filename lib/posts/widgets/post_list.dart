import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapo_two/posts/bloc/posts_bloc.dart';
import 'package:flutter_sapo_two/posts/widgets/post_card.dart';
import 'package:st_post_domain/st_post_domain.dart';
import 'package:st_ui/st_ui.dart';

class PostListView extends StatelessWidget {
  const PostListView({required this.posts, super.key});
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length + 1,
      itemBuilder: (context, index) {
        if (index < posts.length) {
          final post = posts[index];
          return PostCard(post: post);
        } else {
          BlocProvider.of<PostsBloc>(context).add(PostsLoadMorePosts());
          return const StLoadingIndicator();
        }
      },
    );
  }
}
