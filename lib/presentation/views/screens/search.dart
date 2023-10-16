import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data/repo/repo_impl.dart';
import 'package:news_app/domain/usecase/get_search_news.dart';
import 'package:news_app/presentation/views/manager/search_cubit/search_cubit.dart';
import 'package:news_app/util/app_string.dart';
import 'package:news_app/util/components/components.dart';

import '../../../util/services/services_locator.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchCubit(GetSearchUseCase(getIt.get<NewsRepoImpl>())),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                AppString.search,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              iconTheme: const IconThemeData(color: Colors.black),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _searchController,
                    onChanged: (val) {
                      if(val.isNotEmpty)
                      {
                        cubit.getSearchNews(val);
                      }else
                      {
                        cubit.clearSearch();
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: AppString.search,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  if (state is SearchLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (state is SearchFailure)
                    Center(child: Text(state.error))
                  else if (state is SearchSuccess)
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (cubit.news.isNotEmpty && index < cubit.news.length) {
                            return BuildItem(
                              news: cubit.news[index],
                            );
                          } else {
                            return Row(
                              children: [
                                const Icon(Icons.error),
                                Text(
                                  AppString.noData,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            );
                          }
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: cubit.news.length,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
