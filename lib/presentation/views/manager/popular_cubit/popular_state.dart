part of 'popular_cubit.dart';

@immutable
abstract class PopularState extends Equatable {}

class PopularInitial extends PopularState {
  @override
  List<Object?> get props => [];
}

class PopularLoading extends PopularState {
  @override
  List<Object?> get props => [];
}

class PopularSuccess extends PopularState {
  @override
  List<Object?> get props => [];
}

class PopularFailure extends PopularState {
  final String error;

  PopularFailure(this.error);

  @override
  List<Object?> get props => [error];
}
