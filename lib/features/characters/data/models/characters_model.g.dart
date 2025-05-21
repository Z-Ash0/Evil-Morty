// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharactersModelAdapter extends TypeAdapter<CharactersModel> {
  @override
  final int typeId = 0;

  @override
  CharactersModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharactersModel(
      id: fields[0] as int,
      name: fields[1] as String,
      status: fields[2] as String,
      kind: fields[3] as String,
      gender: fields[4] as String,
      type: fields[5] as String?,
      image: fields[6] as String,
      episodes: (fields[7] as List).cast<dynamic>(),
      origin: fields[8] as Origin,
      location: fields[9] as Location,
    );
  }

  @override
  void write(BinaryWriter writer, CharactersModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.kind)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.episodes)
      ..writeByte(8)
      ..write(obj.origin)
      ..writeByte(9)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharactersModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
