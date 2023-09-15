import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/util/error/failure.dart';

abstract class NewsRepo {
  Future<Either<Failure, List<NewsEntity>>> getTopRatedNews();

  Future<Either<Failure, List<NewsEntity>>> getPopularNews();

  Future<Either<Failure, List<NewsEntity>>> getTrendingNews();

  Future<Either<Failure, List<NewsEntity>>> getCategoryNews(String category);

  Future<Either<Failure, List<NewsEntity>>> getSearchNews(String query);
}
