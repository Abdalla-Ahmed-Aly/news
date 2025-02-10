import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news/app_them.dart';
import 'package:news/models/news_response/article.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {
  NewsItem({required this.news});
  Article news;
  Uri? url;
  @override
  Widget build(BuildContext context) {
    url = Uri.parse('${news.url}');
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              padding:
                  EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 10),
              width: double.infinity,
              height: size.height * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      news.urlToImage ?? 'https://i.sstatic.net/y9DpT.jpg',
                      width: double.infinity,
                      height: size.height * 0.3,
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
                  SizedBox(height: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        news.description ?? '${news.title}',
                        style: textTheme.titleSmall
                            ?.copyWith(color: AppThem.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppThem.black,
                      fixedSize: Size(MediaQuery.sizeOf(context).width, 56),
                    ),
                    onPressed: () {
                      launchUrl(url!);
                    },
                    child: Text(
                      'View Full Articel',
                      style: textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
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
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(url!)) {
      throw Exception('Could not launch $url');
    }
  }
}
