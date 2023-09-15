import 'package:dartz/dartz.dart';
import 'package:news_app/util/error/failure.dart';

abstract class UseCase<Type, Parameter> {
  Future<Either<Failure, Type>> call([Parameter parameter]);
}

class NoParameter {}