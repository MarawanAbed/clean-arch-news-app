import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repo/repo_impl.dart';
import 'package:news_app/domain/usecase/get_top_rated_news.dart';
import 'package:news_app/presentation/views/manager/top_cubit/top_cubit.dart';
import 'package:news_app/util/components/components.dart';
import 'package:news_app/util/services/services_locator.dart';

class Top extends StatefulWidget {
  const Top({super.key});

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TopCubit(GetTopRatedUseCase(getIt.get<NewsRepoImpl>()))
            ..getTopRatedNews(),
      child: BlocBuilder<TopCubit, TopState>(
        builder: (context, state) {
          var cubit = TopCubit.get(context);
          if (state is TopLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TopFailure) {
            return Center(child: Text(state.error));
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => BuildItem(
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
