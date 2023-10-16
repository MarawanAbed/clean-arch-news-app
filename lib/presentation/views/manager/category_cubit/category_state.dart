part of 'category_cubit.dart';

@immutable
abstract class CategoryState extends Equatable {}

class CategoryInitial extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategorySuccess extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryFailure extends CategoryState {
  final String message;

  CategoryFailure(this.message);

  @override
  List<Object?> get props => [message];
}
