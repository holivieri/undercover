import 'dart:convert';

List<Notification> notificationFromJson(String str) => List<Notification>.from(
    json.decode(str).map((x) => Notification.fromJson(x)));

String notificationToJson(List<Notification> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notification {
  Notification({
    required this.id,
    required this.title,
    required this.category,
    required this.message,
    required this.deleted,
    required this.createdDate,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json['id'],
        title: json['title'],
        category: json['category'],
        message: json['message'],
        deleted: json['deleted'],
        createdDate: DateTime.parse(json['createdDate']),
      );

  final String id;
  final String title;
  final String category;
  final String message;
  final bool deleted;
  final DateTime createdDate;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'category': category,
        'message': message,
        'deleted': deleted,
        'createdDate': createdDate.toIso8601String(),
      };
}
