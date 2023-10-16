// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:news_app/data/source/local_data_source/local_data_source.dart';
// import 'package:news_app/domain/entity/news_entity.dart';
// import 'package:news_app/util/constant/constant.dart';
//
// class LocalDataSourceImpl extends LocalDataSource {
//   @override
//   List<NewsEntity> getPopularNews() {
//     var box = Hive.box<NewsEntity>(kPopularNewsBox); //we get the box from hive
//     return box.values.toList(); //we return the list
//   }
//
//   @override
//   List<NewsEntity> getTopRatedNews() {
//     var box = Hive.box<NewsEntity>(kTopRatedNewsBox); //we get the box from hive
//     return box.values.toList(); //we return the list
//   }
//
//   @override
//   List<NewsEntity> getTrendingNews() {
//     var box = Hive.box<NewsEntity>(kTrendingNewsBox); //we get the box from hive
//     return box.values.toList(); //we return the list
//   }
// }
