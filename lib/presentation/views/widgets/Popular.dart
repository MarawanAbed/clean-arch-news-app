  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:news_app/data/repo/repo_impl.dart';
  import 'package:news_app/domain/usecase/get_popular_news.dart';
  import 'package:news_app/presentation/views/manager/popular_cubit/popular_cubit.dart';
  import 'package:news_app/util/components/components.dart';
  import 'package:news_app/util/services/services_locator.dart';

  class Popular extends StatefulWidget {
    const Popular({super.key});

    @override
    State<Popular> createState() => _PopularState();
  }

  class _PopularState extends State<Popular> {
    @override
    Widget build(BuildContext context) {
      return BlocProvider(
        create: (context) =>
        PopularCubit(GetPopularUseCase(getIt.get<NewsRepoImpl>()))
          ..getPopularNews(),
        child: BlocBuilder<PopularCubit, PopularState>(
          builder: (context, state) {
            var cubit = PopularCubit.get(context);
            if(state is PopularLoading){
              return const Center(child: CircularProgressIndicator());
            }else if(state is PopularFailure){
              return Center(child: Text(state.error));
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                     BuildItem(
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
