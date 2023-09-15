import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repo/repo_impl.dart';
import 'package:news_app/domain/usecase/get_search_news.dart';
import 'package:news_app/presentation/views/manager/search_cubit/search_cubit.dart';
import 'package:news_app/util/components/components.dart';

import '../../../util/services/services_locator.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
              title: const Text(
                'Search',
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
                    onChanged: (val) {
                      cubit.getSearchNews(val);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (state is SearchLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (state is SearchFailure)
                    Center(child: Text(state.error))
                  else if (state is SearchSuccess)
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => BuildItem(
                          news: cubit.news[index],
                        ),
                        separatorBuilder: (context, index) =>
                            const Divider(),
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
