import 'package:kindergarden/data/entities/user.dart';

class AuthState {
  final User? user;
  final String? accessToken;

  AuthState({
    this.user,
    this.accessToken,
  });

  AuthState copyWith({
    User? user,
    String? accessToken,
  }) =>
      AuthState(
        user: user ?? this.user,
        accessToken: accessToken ?? this.accessToken,
      );
}
