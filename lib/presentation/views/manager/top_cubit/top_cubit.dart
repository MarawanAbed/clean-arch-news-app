import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/domain/usecase/get_top_rated_news.dart';

part 'top_state.dart';

class TopCubit extends Cubit<TopState> {
  TopCubit(this._topRated) : super(TopInitial());
  static TopCubit get(context) => BlocProvider.of(context);
  final GetTopRatedUseCase _topRated;


  List<NewsEntity>news=[];
  getTopRatedNews()async{
    emit(TopLoading());
    final response=await _topRated.call();
    response.fold((l) => emit(TopFailure(l.message)), (r) {
      news=r;
      emit(TopSuccess());
    });
  }
}
