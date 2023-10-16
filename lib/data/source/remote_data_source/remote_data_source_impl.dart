import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/data/source/remote_data_source/remote_data_source.dart';
import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/util/services/api_services.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiServices _services;

  RemoteDataSourceImpl(this._services);

  //
  // Future<List<NewsEntity>> _fetchAndCacheNews(
  //     String endPoint, String boxName) async {
  //   final result = await _services.get(endPoint: endPoint);
  //   final newsList = result['articles']
  //       .map<NewsEntity>((news) => NewsModel.fromJson(news))
  //       .toList();
  //
  //   final box = Hive.box<NewsEntity>(boxName);
  //   box.clear(); // Clear old data
  //   box.addAll(newsList); // Cache data in local storage for offline mode
  //
  //   return newsList;
  // }

  @override
  Future<List<NewsEntity>> getCategoryNews(String category) async {
    final endPoint =
        'v2/top-headlines?category=$category&country=us&apiKey=${ApiServices.apiKey}';
    //without cache
    final result = await _services.get(endPoint: endPoint);
    final newsList = result['articles']
        .map<NewsEntity>((news) => NewsModel.fromJson(news))
        .toList();
    return newsList;
  }

  @override
  Future<List<NewsEntity>> getPopularNews() async {
    const endPoint =
        'v2/top-headlines?country=us&sortBy=popularity&apiKey=${ApiServices.apiKey}';
    final result = await _services.get(endPoint: endPoint);
    final newsList = result['articles']
        .map<NewsEntity>((news) => NewsModel.fromJson(news))
        .toList();
    return newsList;
  }

  @override
  Future<List<NewsEntity>> getSearchNews(String query) async {
    final endPoint = 'v2/everything?q=$query&apiKey=${ApiServices.apiKey}';
    //without cache

    final result = await _services.get(endPoint: endPoint);
    final newsList = result['articles']
        .map<NewsEntity>((news) => NewsModel.fromJson(news))
        .toList();
    return newsList;
  }

  @override
  Future<List<NewsEntity>> getTopRatedNews() async {
    const endPoint = 'v2/top-headlines?country=us&apiKey=${ApiServices.apiKey}';
    final result = await _services.get(endPoint: endPoint);
    final newsList = result['articles']
        .map<NewsEntity>((news) => NewsModel.fromJson(news))
        .toList();
    return newsList;
  }

  @override
  Future<List<NewsEntity>> getTrendingNews() async {
    const endPoint = 'v2/top-headlines?country=us&apiKey=${ApiServices.apiKey}';
    final result = await _services.get(endPoint: endPoint);
    final newsList = result['articles']
        .map<NewsEntity>((news) => NewsModel.fromJson(news))
        .toList();
    return newsList;
  }
}
