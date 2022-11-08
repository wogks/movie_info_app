class FireModel {
  final String title;
  final String uid;
  final String backdropPath;

  FireModel(
      {required this.title, required this.backdropPath, required this.uid});

  FireModel.fromJson(Map<String, dynamic> json)
      : this(
          uid: json['uid']! as String,
          title: json['title']! as String,
          backdropPath: json['backdropPath']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'title': title,
      'backdropPath': backdropPath,
    };
  }
}
