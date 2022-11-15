// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_favorites.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalFavoritesAdapter extends TypeAdapter<LocalFavorites> {
  @override
  final int typeId = 0;

  @override
  LocalFavorites read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalFavorites()
      ..id = fields[0] as int?
      ..name = fields[1] as String?
      ..image = fields[2] as String?
      ..description = fields[3] as String?
      ..rating = fields[4] as double?;
  }

  @override
  void write(BinaryWriter writer, LocalFavorites obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalFavoritesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
