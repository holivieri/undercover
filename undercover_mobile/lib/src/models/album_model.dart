class Album {
  Album({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.releaseYear,
    this.songs,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json['id'],
        title: json['title'],
        imageUrl: json['imageUrl'],
        releaseYear: json['releaseYear'],
        songs: json['songs'],
      );

  final String id;
  final String title;
  final String imageUrl;
  final int releaseYear;
  final dynamic songs;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'imageUrl': imageUrl,
        'releaseYear': releaseYear,
        'songs': songs,
      };
}
