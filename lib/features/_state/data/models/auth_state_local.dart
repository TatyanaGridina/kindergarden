import 'package:hive/hive.dart';
import 'package:kindergarden/data/entities/user.dart';
import 'package:kindergarden/features/_state/state/auth_state.dart';

part 'auth_state_local.g.dart';

@HiveType(typeId: 1)
class AuthStateLocal extends HiveObject {
  @HiveField(0)
  final User? user;
  @HiveField(1)
  final String? accessToken;

  AuthStateLocal({
    required this.user,
    required this.accessToken,
  });

  factory AuthStateLocal.fromAuthState(AuthState state) {
    return AuthStateLocal(
      user: state.user,
      accessToken: state.accessToken,
    );
  }

  toLoginState() => AuthState(
        user: user,
        accessToken: accessToken,
      );
}
