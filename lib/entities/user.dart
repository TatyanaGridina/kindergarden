class User {
  final String email;
  final String name;
  final UserRole role;
  final String? token;

  User({required this.email, required this.name, required this.role, required this.token});
}

enum UserRole { parent, teacher, chef }
