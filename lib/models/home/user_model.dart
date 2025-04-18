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

// Model Class for Posts
class Post {
  final String profileImage;
  final String username;
  final String time;
  final String description;
  final String postImg;

  Post({
    required this.profileImage,
    required this.username,
    required this.time,
    required this.description,
    required this.postImg,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      profileImage: json['profileImage'],
      username: json['username'],
      time: json['time'],
      description: json['description'],
      postImg: json['postImg'],
    );
  }
}