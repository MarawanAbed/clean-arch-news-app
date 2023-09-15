import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/domain/usecase/get_popular_news.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this._popularUseCase) : super(PopularInitial());

  static PopularCubit get(context) => BlocProvider.of(context);

  final GetPopularUseCase _popularUseCase;

  List<NewsEntity>news=[];

  getPopularNews()async{
    emit(PopularLoading());
    final response=await _popularUseCase.call();
    response.fold((l) => emit(PopularFailure(l.message)), (r) {
      news=r;
      emit(PopularSuccess());
    });
  }
}
