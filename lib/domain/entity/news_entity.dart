import 'package:hive_flutter/hive_flutter.dart';
part 'news_entity.g.dart';

@HiveType(typeId: 0)
class NewsEntity{
  @HiveField(0)
  final String? titleNews;
  @HiveField(1)
  final String? authorNews;
  @HiveField(2)
  final String? urlNews;
  @HiveField(3)
  final String? urlToImageNews;
  @HiveField(4)
  final String? publishedAtNews;

  NewsEntity(
      {
        required this.titleNews,
        required this.authorNews,
        required this.urlNews,
        required this.urlToImageNews,
        required this.publishedAtNews,
      });
}