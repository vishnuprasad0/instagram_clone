class User {
  final String username;
  final String email;
  final String uid;
  final String bio;
  final String profilephotoUrl;
  final List followers;
  final List following;

  User(
      {required this.username,
      required this.email,
      required this.uid,
      required this.bio,
      required this.profilephotoUrl,
      required this.followers,
      required this.following});

  Map<String, dynamic> tojson() => {
        'username': username,
        'uid': uid,
        "email": email,
        "bio": bio,
        'followers': [],
        'following': [],
        'photoUrl': profilephotoUrl,
      };
}
