import 'package:hive/hive.dart';
import 'package:kindergarden/entities/user.dart';

part 'user_role_local.g.dart';

@HiveType(typeId: 3)
enum UserRoleLocal {
  @HiveField(0)
  parent,
  @HiveField(1)
  teacher,
  @HiveField(2)
  chef,
}

extension UserRoleLocalExtension on UserRoleLocal {
  UserRole toUserRole() {
    switch (this) {
      case UserRoleLocal.parent:
        return UserRole.parent;
      case UserRoleLocal.teacher:
        return UserRole.teacher;
      case UserRoleLocal.chef:
        return UserRole.chef;
    }
  }
}

extension UserRoleExtension on UserRole {
  UserRoleLocal toLocal() {
    switch (this) {
      case UserRole.parent:
        return UserRoleLocal.parent;
      case UserRole.teacher:
        return UserRoleLocal.teacher;
      case UserRole.chef:
        return UserRoleLocal.chef;
    }
  }
}
