part of 'top_cubit.dart';

@immutable
abstract class TopState {}

class TopInitial extends TopState {}
class TopLoading extends TopState {}
class TopSuccess extends TopState {}
class TopFailure extends TopState {
  final String error;

  TopFailure(this.error);
}
