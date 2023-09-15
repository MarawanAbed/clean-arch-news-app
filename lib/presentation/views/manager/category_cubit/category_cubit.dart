import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/domain/usecase/get_category_news.dart';

import '../../../../domain/entity/news_entity.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._getCategoryUseCase) : super(CategoryInitial());

  final GetCategoryUseCase _getCategoryUseCase;

  static CategoryCubit get(context) => BlocProvider.of(context);
  List<NewsEntity> news = [];

  getCategoryNews(String category) async {
    emit(CategoryLoading());
    try {
      final response = await _getCategoryUseCase.call(category);
      response.fold((l) => emit(CategoryFailure(l.message)), (r) {
        news = r;
        emit(CategorySuccess());
      });
    } catch (e) {
      emit(CategoryFailure(e.toString()));
    }
  }
}
