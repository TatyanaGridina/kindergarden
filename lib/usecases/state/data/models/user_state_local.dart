import 'package:hive/hive.dart';
import 'package:kindergarden/usecases/state/data/models/user_role_local.dart';
import 'package:kindergarden/state/user_state.dart';

part 'user_state_local.g.dart';

@HiveType(typeId: 1)
class UserStateLocal extends HiveObject {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final UserRoleLocal role;
  @HiveField(3)
  final String? token;

  UserStateLocal({
    required this.email,
    required this.name,
    required this.role,
    required this.token,
  });

  factory UserStateLocal.fromUserState(UserState state) {
    return UserStateLocal(
      email: state.email,
      name: state.name,
      role: state.role.toLocal(),
      token: state.token,
    );
  }

  toUserState() => UserState(
        email: email,
        name: name,
        role: role.toUserRole(),
        token: token,
      );
}

