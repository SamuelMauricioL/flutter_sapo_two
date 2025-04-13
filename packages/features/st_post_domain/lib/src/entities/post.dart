import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post({
    required this.id,
    required this.author,
    required this.content,
    required this.timestamp,
    required this.likes,
    required this.dislikes,
  });
  final String id;
  final String author;
  final String content;
  final DateTime timestamp;
  final int likes;
  final int dislikes;

  @override
  List<Object?> get props => [id, author, content, timestamp, likes, dislikes];

  Post copyWith({
    String? id,
    String? author,
    String? content,
    DateTime? timestamp,
    int? likes,
    int? dislikes,
  }) {
    return Post(
      id: id ?? this.id,
      author: author ?? this.author,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
    );
  }
}
