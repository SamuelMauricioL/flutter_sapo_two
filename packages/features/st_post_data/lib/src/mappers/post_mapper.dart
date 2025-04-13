import 'package:st_post_data/src/models/post_model.dart';
import 'package:st_post_domain/st_post_domain.dart';

extension PostModelMapper on PostModel {
  Post toEntity() {
    return Post(
      id: id,
      author: author,
      content: content,
      timestamp: timestamp,
      likes: likes,
      dislikes: dislikes,
    );
  }
}
