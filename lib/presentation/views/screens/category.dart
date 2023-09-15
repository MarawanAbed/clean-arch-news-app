import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repo/repo_impl.dart';
import 'package:news_app/domain/usecase/get_category_news.dart';
import 'package:news_app/presentation/views/manager/category_cubit/category_cubit.dart';
import 'package:news_app/util/components/components.dart';
import 'package:news_app/util/services/services_locator.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCubit(GetCategoryUseCase(getIt.get<NewsRepoImpl>()))
            ..getCategoryNews(category),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          var cubit = CategoryCubit.get(context);
          if (state is CategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoryFailure) {
            return Center(child: Text(state.message));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                category,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              iconTheme: const IconThemeData(color: Colors.black),
              centerTitle: true,
              
            ),
            body: SingleChildScrollView(
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
            ),
          );
        },
      ),
    );
  }
}
