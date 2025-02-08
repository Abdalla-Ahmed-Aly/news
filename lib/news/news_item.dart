import 'package:flutter/material.dart';
import 'package:news/app_them.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppThem.white, width: 1)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/news.png',
              height: MediaQuery.sizeOf(context).height * 0.2,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '40-year-old man falls 200 feet to his death while canyoneering at national park',
            style: textTheme.titleMedium,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'By : Jon Haworth',
                style: textTheme.labelMedium,
              ),
              Text(
                '15 minutes ago',
                                style: textTheme.labelMedium,

              ),
            ],
          )
        ],
      ),
    );
  }
}
