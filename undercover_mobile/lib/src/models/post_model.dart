class Post {
  Post({
    required this.id,
    required this.createdDate,
    required this.title,
    this.details,
    this.pictureUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['id'],
        createdDate: DateTime.parse(json['createdDate']),
        title: json['title'],
        details: json['details'],
        pictureUrl: json['pictureUrl'],
      );

  final String id;
  final DateTime createdDate;
  final String title;
  final String? details;
  final String? pictureUrl;

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdDate': createdDate.toIso8601String(),
        'title': title,
        'details': details,
        'pictureUrl': pictureUrl,
      };
}
