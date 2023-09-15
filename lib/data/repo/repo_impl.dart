import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/data/source/local_data_source/local_data_source.dart';
import 'package:news_app/data/source/remote_data_source/remote_data_source.dart';
import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/domain/repo/news_repo.dart';
import 'package:news_app/util/error/failure.dart';

class NewsRepoImpl extends NewsRepo {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  NewsRepoImpl(this._remoteDataSource, this._localDataSource);

  Future<Either<Failure, List<NewsEntity>>> _handleError(e) {
    if (e is DioException) {
      return Future.value(Left(ServerFailure.fromDiorError(e)));
    } else {
      return Future.value(Left(ServerFailure(e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getCategoryNews(
      String category) async {
    try {
      final news = await _remoteDataSource.getCategoryNews(category);
      return Right(news);
    } catch (e) {
      return _handleError(e);
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getPopularNews() async {
    try {
      final box =  _localDataSource.getPopularNews();
      if (box.isNotEmpty) {
        return Right(box);
      }
      final news = await _remoteDataSource.getPopularNews();
      return Right(news);
    } catch (e) {
      return _handleError(e);
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getSearchNews(String query) async {
    try {
      final news = await _remoteDataSource.getSearchNews(query);
      return Right(news);
    } catch (e) {
      return _handleError(e);
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getTopRatedNews() async {
    try {
      final box =  _localDataSource.getTopRatedNews();
      if (box.isNotEmpty) {
        return Right(box);
      }
      final news = await _remoteDataSource.getTopRatedNews();
      return Right(news);
    } catch (e) {
      return _handleError(e);
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getTrendingNews() async {
    try {
      final box =  _localDataSource.getTrendingNews();
      if (box.isNotEmpty) {
        return Right(box);
      }
      final news = await _remoteDataSource.getTrendingNews();
      return Right(news);
    } catch (e) {
      return _handleError(e);
    }
  }
}
