// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserStateLocalAdapter extends TypeAdapter<UserStateLocal> {
  @override
  final int typeId = 1;

  @override
  UserStateLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserStateLocal(
      email: fields[0] as String,
      name: fields[1] as String,
      role: fields[2] as UserRoleLocal,
      token: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserStateLocal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.role)
      ..writeByte(3)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStateLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
