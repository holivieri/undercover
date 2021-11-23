class LoginError {
  LoginError({
    required this.code,
    required this.description,
  });

  final String code;
  final String description;

  @override
  String toString() {
    return '$code - $description';
  }
}
