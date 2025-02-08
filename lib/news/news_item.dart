import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news/app_them.dart';
import 'package:news/models/news_response/article.dart';

class NewsItem extends StatelessWidget {
  NewsItem({required this.news});
  Article news;
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
            child: Image.network(
              news.urlToImage ?? 'https://i.sstatic.net/y9DpT.jpg',
              height: MediaQuery.sizeOf(context).height * 0.2,
              width: double.infinity,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/default_news.jpg', 
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  width: double.infinity,
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            news.title ?? '',
            style: textTheme.titleMedium,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'By : ${news.source!.name ?? ''}',
                style: textTheme.labelMedium,
              ),
              Text(
                timeago.format(news.publishedAt ?? DateTime.now()),
                style: textTheme.labelMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}
