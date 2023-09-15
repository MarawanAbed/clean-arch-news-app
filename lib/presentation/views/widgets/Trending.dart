import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repo/repo_impl.dart';
import 'package:news_app/presentation/views/manager/trending_cubit/trending_cubit.dart';
import 'package:news_app/util/services/services_locator.dart';

import '../../../domain/usecase/get_trending_news.dart';
import '../../../util/components/components.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TrendingCubit(GetTrendingUseCase(getIt.get<NewsRepoImpl>()))
            ..getTrendingNews(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          var cubit = TrendingCubit.get(context);
          if (state is TrendingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TrendingFailure) {
            return Center(child: Text(state.error));
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>  BuildItem(
                    news: cubit.news[index],
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: cubit.news.length,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
