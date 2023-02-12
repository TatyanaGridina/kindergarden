// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRoleLocalAdapter extends TypeAdapter<UserRoleLocal> {
  @override
  final int typeId = 3;

  @override
  UserRoleLocal read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserRoleLocal.parent;
      case 1:
        return UserRoleLocal.teacher;
      case 2:
        return UserRoleLocal.chef;
      default:
        return UserRoleLocal.parent;
    }
  }

  @override
  void write(BinaryWriter writer, UserRoleLocal obj) {
    switch (obj) {
      case UserRoleLocal.parent:
        writer.writeByte(0);
        break;
      case UserRoleLocal.teacher:
        writer.writeByte(1);
        break;
      case UserRoleLocal.chef:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRoleLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
