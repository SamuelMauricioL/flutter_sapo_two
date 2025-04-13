import 'package:oxidized/oxidized.dart';
import 'package:st_post_domain/st_post_domain.dart';
import 'package:st_utils/st_utils.dart';

abstract class PostRepository {
  Future<Result<List<Post>, StFailure>> getPosts(int limit, int offset);
  Future<Result<void, StFailure>> likePost(String postId);
  Future<Result<void, StFailure>> dislikePost(String postId);
}
