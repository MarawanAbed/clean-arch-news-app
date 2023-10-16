part of 'trending_cubit.dart';

@immutable
abstract class TrendingState extends Equatable{}

class TrendingInitial extends TrendingState {
  @override
  List<Object?> get props => [];
}

class TrendingLoading extends TrendingState {
  @override
  List<Object?> get props => [];
}
class TrendingSuccess extends TrendingState {
  @override
  List<Object?> get props => [];
}
class TrendingFailure extends TrendingState {
  final String error;

  TrendingFailure(this.error);

  @override
  List<Object?> get props => [error];
}
