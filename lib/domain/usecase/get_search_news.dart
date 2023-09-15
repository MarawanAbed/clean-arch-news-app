import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/domain/repo/news_repo.dart';
import 'package:news_app/util/error/failure.dart';
import 'package:news_app/util/usecase/usecase.dart';

class GetSearchUseCase extends UseCase<List<NewsEntity>, String> {
  final NewsRepo _newsRepository;

  GetSearchUseCase(this._newsRepository);

  @override
  Future<Either<Failure, List<NewsEntity>>> call([String? query]) async {
    return await _newsRepository.getSearchNews(query!);
  }
}
