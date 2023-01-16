// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthStateLocalAdapter extends TypeAdapter<AuthStateLocal> {
  @override
  final int typeId = 1;

  @override
  AuthStateLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthStateLocal(
      user: fields[0] as User?,
      accessToken: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthStateLocal obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.user)
      ..writeByte(1)
      ..write(obj.accessToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthStateLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
