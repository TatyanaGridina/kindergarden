// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garden_state_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GardenStateLocalAdapter extends TypeAdapter<GardenStateLocal> {
  @override
  final int typeId = 2;

  @override
  GardenStateLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GardenStateLocal(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GardenStateLocal obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GardenStateLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
