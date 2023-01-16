// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StateLocalAdapter extends TypeAdapter<StateLocal> {
  @override
  final int typeId = 0;

  @override
  StateLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StateLocal(
      login: fields[0] as AuthStateLocal,
    );
  }

  @override
  void write(BinaryWriter writer, StateLocal obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.login);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StateLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
