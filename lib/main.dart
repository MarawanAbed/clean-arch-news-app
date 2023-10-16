import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/presentation/views/screens/home.dart';
import 'package:news_app/util/bloc_observer.dart';
import 'package:news_app/util/constant/constant.dart';
import 'package:news_app/util/services/services_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NewsEntityAdapter());
  await Hive.openBox<NewsEntity>(kTopRatedNewsBox);
  await Hive.openBox<NewsEntity>(kPopularNewsBox);
  await Hive.openBox<NewsEntity>(kTrendingNewsBox);
  await Hive.openBox<NewsEntity>(kCategoryNewsBox);

  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        home: HomeScreen(),
      ),
    );
  }
}



