import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapo_two/posts/bloc/posts_bloc.dart';
import 'package:st_post_domain/st_post_domain.dart';
import 'package:st_ui/st_ui.dart';

class PostCard extends StatelessWidget {
  const PostCard({required this.post, super.key});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return StCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Author: ${post.author}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Content: ${post.content}'),
          Text('Timestamp: ${post.timestamp}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.thumb_up),
                    onPressed: () {
                      BlocProvider.of<PostsBloc>(context)
                          .add(PostsLikePost(post.id));
                    },
                  ),
                  Text('${post.likes}'),
                  IconButton(
                    icon: const Icon(Icons.thumb_down),
                    onPressed: () {
                      BlocProvider.of<PostsBloc>(context)
                          .add(PostsDislikePost(post.id));
                    },
                  ),
                  Text('${post.dislikes}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
