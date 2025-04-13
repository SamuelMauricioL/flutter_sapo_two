import 'package:oxidized/oxidized.dart';
import 'package:st_post_domain/st_post_domain.dart';
import 'package:st_utils/st_utils.dart';

class GetPosts {
  GetPosts({required this.repository});
  final PostRepository repository;

  Future<Result<List<Post>, StFailure>> call(GetPostsParams params) {
    return repository.getPosts(params.limit, params.offset);
  }
}

class GetPostsParams {
  const GetPostsParams({required this.limit, required this.offset});
  final int limit;
  final int offset;
}
