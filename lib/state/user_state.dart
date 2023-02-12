
import 'package:kindergarden/entities/user.dart';

class UserState implements User {
  @override
  final String email;
  @override
  final String name;
  @override
  final UserRole role;
  @override
  final String? token;

  UserState({
    this.email = '',
    this.name = '',
    this.role = UserRole.parent,
    this.token,
  });

  UserState copyWith({
    String? email,
    String? name,
    UserRole? role,
    String? token,
  }) =>
      UserState(
        email: email ?? this.email,
        name: name ?? this.name,
        role: role ?? this.role,
        token: token ?? this.token,
      );
}
