part of 'top_cubit.dart';

@immutable
abstract class TopState extends Equatable {}

class TopInitial extends TopState {
  @override
  List<Object?> get props => [];
}

class TopLoading extends TopState {
  @override
  List<Object?> get props => [];
}

class TopSuccess extends TopState {
  @override
  List<Object?> get props => [];
}

class TopFailure extends TopState {
  final String error;

  TopFailure(this.error);

  @override
  List<Object?> get props => [error];
}
