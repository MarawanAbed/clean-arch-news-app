import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation/views/screens/search.dart';
import 'package:news_app/presentation/views/widgets/Category.dart';
import 'package:news_app/presentation/views/widgets/Popular.dart';
import 'package:news_app/presentation/views/widgets/Top.dart';
import 'package:news_app/presentation/views/widgets/Trending.dart';
import 'package:news_app/util/app_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabList = [
    Tab(text: AppString.topHeadline),
    Tab(text: AppString.popular),
    Tab(text: AppString.trending),
    Tab(text: AppString.categoryTitle),
  ];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          AppString.appTitle,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0.h),
          child: TabBar(
            controller: _tabController,
            tabs: _tabList,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
          ),
           SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Top(),
          Popular(),
          Trending(),
          Category(),
        ],
      ),
    );
  }
}
