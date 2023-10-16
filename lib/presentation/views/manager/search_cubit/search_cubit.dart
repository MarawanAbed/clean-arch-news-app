import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/domain/usecase/get_search_news.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._getSearch) : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  final GetSearchUseCase _getSearch;

  List<NewsEntity>news=[];

  getSearchNews(String search)async{
    emit(SearchLoading());
    try{
      final response = await _getSearch.call(search);
      response.fold((l) => emit(SearchFailure(l.message)), (r) {
        news = r;
        emit(SearchSuccess());
      });
    }catch(e){
      emit(SearchFailure(e.toString()));
    }
  }
  //clear search
  clearSearch(){
    news=[];
    emit(SearchInitial());
  }
}
