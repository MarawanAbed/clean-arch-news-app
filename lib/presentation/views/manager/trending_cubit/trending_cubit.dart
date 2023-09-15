import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/domain/usecase/get_trending_news.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit(this._trending) : super(TrendingInitial());

  final GetTrendingUseCase _trending;

  static TrendingCubit get(context) => BlocProvider.of(context);

  List<NewsEntity> news = [];

  getTrendingNews() async {
    emit(TrendingLoading());
    final response = await _trending.call();
    response.fold((l) => emit(TrendingFailure(l.message)),
            (r) {
      news = r;
      emit(TrendingSuccess());
    });
  }
}
