import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:st_post_data/src/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts({
    int limit = 30,
    String? lastDocumentId,
  });
  Future<void> likePost(String postId);
  Future<void> dislikePost(String postId);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  PostRemoteDataSourceImpl();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<PostModel>> getPosts({
    int limit = 30,
    String? lastDocumentId,
  }) async {
    var postsQuery = _firestore
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .limit(limit);

    if (lastDocumentId != null) {
      final lastDocument =
          await _firestore.collection('posts').doc(lastDocumentId).get();
      postsQuery = postsQuery.startAfterDocument(lastDocument);
    }

    final snapshot = await postsQuery.get();

    return snapshot.docs
        .map((doc) => PostModel.fromJson(doc.id, doc.data()))
        .toList();
  }

  @override
  Future<void> likePost(String postId) async {
    await _firestore
        .collection('posts')
        .doc(postId)
        .update({'likes': FieldValue.increment(1)});
  }

  @override
  Future<void> dislikePost(String postId) async {
    await _firestore
        .collection('posts')
        .doc(postId)
        .update({'dislikes': FieldValue.increment(1)});
  }
}
