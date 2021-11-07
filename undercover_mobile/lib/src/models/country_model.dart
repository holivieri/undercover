class Country {
  Country({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
