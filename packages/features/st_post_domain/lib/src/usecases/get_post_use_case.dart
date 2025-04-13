import 'package:oxidized/oxidized.dart';
import 'package:st_post_domain/st_post_domain.dart';
import 'package:st_utils/st_utils.dart';

class GetPostsUseCase {
  GetPostsUseCase({required this.repository});
  final PostRepository repository;

  Future<Result<List<Post>, StFailure>> call(GetPostsParams params) {
    return repository.getPosts(
      limit: params.limit,
      lastDocumentId: params.lastDocumentId,
    );
  }
}

class GetPostsParams {
  const GetPostsParams({required this.limit, this.lastDocumentId});
  final int limit;
  final String? lastDocumentId;
}
