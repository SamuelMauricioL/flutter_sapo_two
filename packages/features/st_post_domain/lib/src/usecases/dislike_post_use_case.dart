import 'package:oxidized/oxidized.dart';
import 'package:st_post_domain/st_post_domain.dart';
import 'package:st_utils/st_utils.dart';

class DislikePostUseCase {
  DislikePostUseCase({required this.repository});
  final PostRepository repository;

  Future<Result<void, StFailure>> call(DislikePostParams params) {
    return repository.dislikePost(params.postId);
  }
}

class DislikePostParams {
  const DislikePostParams({required this.postId});
  final String postId;
}
