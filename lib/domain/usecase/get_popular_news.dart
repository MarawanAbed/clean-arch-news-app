import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/domain/repo/news_repo.dart';
import 'package:news_app/util/error/failure.dart';
import 'package:news_app/util/usecase/usecase.dart';

class GetPopularUseCase extends UseCase<List<NewsEntity>, NoParameter>{
  final NewsRepo _newsRepository;

  GetPopularUseCase(this._newsRepository);

  @override
  Future<Either<Failure, List<NewsEntity>>> call([NoParameter? parameter]) async{
    return await _newsRepository.getPopularNews();
  }


}