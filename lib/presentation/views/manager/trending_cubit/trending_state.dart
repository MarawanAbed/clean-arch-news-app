part of 'trending_cubit.dart';

@immutable
abstract class TrendingState {}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}
class TrendingSuccess extends TrendingState {}
class TrendingFailure extends TrendingState {
  final String error;

  TrendingFailure(this.error);
}
