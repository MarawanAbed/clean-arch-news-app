// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsEntityAdapter extends TypeAdapter<NewsEntity> {
  @override
  final int typeId = 0;

  @override
  NewsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsEntity(
      titleNews: fields[0] as String?,
      authorNews: fields[1] as String?,
      urlNews: fields[2] as String?,
      urlToImageNews: fields[3] as String?,
      publishedAtNews: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.titleNews)
      ..writeByte(1)
      ..write(obj.authorNews)
      ..writeByte(2)
      ..write(obj.urlNews)
      ..writeByte(3)
      ..write(obj.urlToImageNews)
      ..writeByte(4)
      ..write(obj.publishedAtNews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
