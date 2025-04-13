import 'package:oxidized/oxidized.dart';
import 'package:st_post_domain/st_post_domain.dart';
import 'package:st_utils/st_utils.dart';

class LikePostUseCase {
  LikePostUseCase({required this.repository});
  final PostRepository repository;

  Future<Result<void, StFailure>> call(LikePostParams params) {
    return repository.likePost(params.postId);
  }
}

class LikePostParams {
  const LikePostParams({required this.postId});
  final String postId;
}
