import 'package:news_app/util/components/components.dart';

class AppString{

  static const String appTitle='News App';
  static const String topHeadline = 'Top Headline';
  static const String popular = 'Popular';
  static const String trending = 'Trending';
  static const String categoryTitle = 'Category';
  static const String search = 'Search';
  static const String noData = 'No Data';
  static const String nullData = 'Null Data';
  static const String invalidFormat = 'Invalid Format';
  static const String dateFormat = 'yyyy-MM-dd';

  static final List<CategoryModel> category = [
    CategoryModel('business', 'assets/business.avif'),
    CategoryModel('entertainment', 'assets/entertaiment.avif'),
    CategoryModel('general', 'assets/general.avif'),
    CategoryModel('health', 'assets/health.avif'),
    CategoryModel('science', 'assets/science.avif'),
    CategoryModel('sports', 'assets/sports.avif'),
    CategoryModel('technology', 'assets/technology.avif'),
  ];
}