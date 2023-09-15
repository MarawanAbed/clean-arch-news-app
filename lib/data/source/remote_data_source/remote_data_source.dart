import 'package:news_app/domain/entity/news_entity.dart';

abstract class RemoteDataSource{
  Future<List<NewsEntity>> getTopRatedNews();
  Future<List<NewsEntity>> getPopularNews();
  Future<List<NewsEntity>> getTrendingNews();
  Future<List<NewsEntity>> getCategoryNews(String category);
  Future<List<NewsEntity>> getSearchNews(String query);
}