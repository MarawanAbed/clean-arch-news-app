part of 'search_cubit.dart';

@immutable
abstract class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}
class SearchLoading extends SearchState {
  @override
  List<Object?> get props => [];
}
class SearchSuccess extends SearchState {
  @override
  List<Object?> get props => [];
}
class SearchFailure extends SearchState {
  final String error;

  SearchFailure(this.error);

  @override
  List<Object?> get props => [error];
}
