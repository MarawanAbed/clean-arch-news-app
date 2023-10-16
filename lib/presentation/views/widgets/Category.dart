import 'package:flutter/material.dart';
import 'package:news_app/presentation/views/screens/category.dart';
import 'package:news_app/util/app_string.dart';
import 'package:news_app/util/components/components.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final maxCrossAxisExtent = screenWidth < 600 ? 200.0 : 250.0;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent,
        childAspectRatio: 1.0, // Square aspect ratio for category items
      ),
      itemCount: AppString.category.length,
      itemBuilder: (context, index) =>
          BuildCategoryItem(category: AppString.category[index]),
    );
  }
}

class BuildCategoryItem extends StatelessWidget {
  const BuildCategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final containerSize =
        MediaQuery.of(context).size.width < 600 ? 170.0 : 200.0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
              category: category.title,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: containerSize,
          width: containerSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(category.image),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                category.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
