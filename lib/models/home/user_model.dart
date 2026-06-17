class User {
  final String name;
  final String role;
  final String location;
  final String imageUrl;

  User({
    required this.name,
    required this.role,
    required this.location,
    required this.imageUrl,
  });
}

// Model Class for Posts from the backend API
class Post {
  final String id;
  final String authorUid;
  final String authorDisplayName;
  final String authorPhotoUrl;
  final String text;
  final List<String> mediaUrls;
  final String createdAt;

  Post({
    required this.id,
    required this.authorUid,
    required this.authorDisplayName,
    this.authorPhotoUrl = '',
    required this.text,
    this.mediaUrls = const [],
    required this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? '',
      authorUid: json['authorUid'] ?? '',
      authorDisplayName: json['authorDisplayName'] ?? 'Unknown',
      authorPhotoUrl: json['authorPhotoUrl'] ?? '',
      text: json['text'] ?? '',
      mediaUrls: (json['mediaUrls'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      createdAt: json['createdAt'] ?? '',
    );
  }
}
