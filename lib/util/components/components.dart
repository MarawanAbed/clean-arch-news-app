import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/presentation/views/screens/web_view.dart';
import 'package:news_app/util/app_string.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    Key? key,
    required this.news,
  }) : super(key: key);

  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    String formatTime(String? timeString) {
      if (timeString == null) {
        return AppString.nullData;
      }

      final parsedTime = DateTime.tryParse(timeString);
      if (parsedTime != null) {
        final formattedTime = DateFormat(AppString.dateFormat).format(parsedTime);
        return formattedTime;
      } else {
        return AppString.invalidFormat;
      }
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate the image width and height based on screen size
    final imageWidth = screenWidth * 0.3;
    final imageHeight = screenHeight * 0.2;

    // Calculate the font size for the title text based on screen width
    final titleFontSize = screenWidth < 600 ? 16.0 : 20.0;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(
                      url: news.urlNews! ,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: news.urlToImageNews ?? ' ',
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: imageHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.calendar_today),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            formatTime(news.publishedAtNews ?? ' '),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      news.titleNews ?? ' ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: titleFontSize,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            news.authorNews ?? ' ',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryModel {
  final String title;
  final String image;

  CategoryModel(this.title, this.image);
}

class Country{
  final String name;
  final String code;

  Country({required this.name, required this.code});

}