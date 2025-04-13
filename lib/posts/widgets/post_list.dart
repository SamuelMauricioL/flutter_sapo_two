import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapo_two/posts/bloc/posts_bloc.dart';
import 'package:flutter_sapo_two/posts/widgets/post_card.dart';
import 'package:st_post_domain/st_post_domain.dart';
import 'package:st_ui/st_ui.dart';

class PostListView extends StatefulWidget {
  const PostListView({
    required this.posts,
    super.key,
    this.hasReachedMax = false,
  });
  final List<Post> posts;
  final bool hasReachedMax;

  @override
  State<PostListView> createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    if (widget.hasReachedMax) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (widget.posts.length > 20 &&
        _isCloseTo20thItem(currentScroll, maxScroll)) {
      context.read<PostsBloc>().add(PostsLoadMorePosts());
    }
  }

  bool _isCloseTo20thItem(double currentScroll, double maxScroll) {
    const itemHeight = 100.0;
    const triggerPosition = 20 * itemHeight;

    return currentScroll >= triggerPosition &&
        currentScroll >= (maxScroll - 200);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.posts.length + (widget.hasReachedMax ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < widget.posts.length) {
          final post = widget.posts[index];
          return PostCard(post: post);
        } else {
          return widget.hasReachedMax
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(child: Text('No more posts')),
                )
              : const StLoadingIndicator();
        }
      },
    );
  }
}
