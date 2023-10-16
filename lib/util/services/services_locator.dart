import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/data/repo/repo_impl.dart';
import 'package:news_app/data/source/remote_data_source/remote_data_source_impl.dart';
import 'package:news_app/util/services/api_services.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<NewsRepoImpl>(
    NewsRepoImpl(
      RemoteDataSourceImpl(getIt.get<ApiServices>()),
    ),
  );

}