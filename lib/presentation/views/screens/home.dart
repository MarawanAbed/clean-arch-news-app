import 'package:flutter/material.dart';
import 'package:news_app/presentation/views/screens/search.dart';
import 'package:news_app/presentation/views/widgets/Top.dart';
import 'package:news_app/presentation/views/widgets/Popular.dart';
import 'package:news_app/presentation/views/widgets/Trending.dart';
import 'package:news_app/presentation/views/widgets/Category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabList = [
    const Tab(text: 'Top '),
    const Tab(text: 'Popular'),
    const Tab(text: 'Trending'),
    const Tab(text: 'Category'),
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
        title: const Text(
          'News App',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchScreen()));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children:const [
          Top(),
          Popular(),
          Trending(),
          Category(),
        ],
      ),
    );
  }
}