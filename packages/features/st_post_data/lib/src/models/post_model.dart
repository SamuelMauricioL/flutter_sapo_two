import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  PostModel({
    required this.id,
    required this.author,
    required this.content,
    required this.timestamp,
    required this.likes,
    required this.dislikes,
  });

  factory PostModel.fromJson(String id, Map<String, dynamic> json) {
    return PostModel(
      id: id,
      author: (json['author'] as String?) ?? '',
      content: (json['content'] as String?) ?? '',
      timestamp: (json['timestamp'] as Timestamp? ?? Timestamp.now()).toDate(),
      likes: (json['likes'] as int?) ?? 0,
      dislikes: (json['dislikes'] as int?) ?? 0,
    );
  }

  final String id;
  final String author;
  final String content;
  final DateTime timestamp;
  final int likes;
  final int dislikes;
}
