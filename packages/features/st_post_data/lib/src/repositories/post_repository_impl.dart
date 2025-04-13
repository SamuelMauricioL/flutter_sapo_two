import 'package:oxidized/oxidized.dart';
import 'package:st_post_data/src/datasources/post_remote_data_source.dart';
import 'package:st_post_data/src/mappers/post_mapper.dart';
import 'package:st_post_domain/st_post_domain.dart';
import 'package:st_utils/st_utils.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl(this._remoteDataSource);
  final PostRemoteDataSource _remoteDataSource;

  @override
  Future<Result<List<Post>, StFailure>> getPosts(int limit, int offset) async {
    try {
      final result = await _remoteDataSource.getPosts(limit, offset);
      return Ok(result.map((model) => model.toEntity()).toList());
    } catch (e) {
      return const Err(ServerFailure());
    }
  }

  @override
  Future<Result<void, StFailure>> likePost(String postId) async {
    try {
      await _remoteDataSource.likePost(postId);
      return const Ok(null);
    } catch (e) {
      return const Err(ServerFailure());
    }
  }

  @override
  Future<Result<void, StFailure>> dislikePost(String postId) async {
    try {
      await _remoteDataSource.dislikePost(postId);
      return const Ok(null);
    } catch (e) {
      return const Err(ServerFailure());
    }
  }
}
