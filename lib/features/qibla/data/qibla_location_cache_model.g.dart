// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qibla_location_cache_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QiblaLocationCacheModelAdapter
    extends TypeAdapter<QiblaLocationCacheModel> {
  @override
  final int typeId = 11;

  @override
  QiblaLocationCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QiblaLocationCacheModel(
      lat: fields[0] as double,
      lng: fields[1] as double,
      cityLabel: fields[2] as String,
      accuracy: fields[3] as double,
      cachedAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, QiblaLocationCacheModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng)
      ..writeByte(2)
      ..write(obj.cityLabel)
      ..writeByte(3)
      ..write(obj.accuracy)
      ..writeByte(4)
      ..write(obj.cachedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QiblaLocationCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
