import 'package:flutter/material.dart';
import 'package:news/Api/api_service.dart';
import 'package:news/app_them.dart';
import 'package:news/models/news_response/article.dart';
import 'package:news/models/sourse_response/source.dart';
import 'package:news/models/sourse_response/sourse_response.dart';
import 'package:news/news/news_item.dart';
import 'package:news/news/tab_item.dart';
import 'package:news/widget/error_indicator.dart';
import 'package:news/widget/loading_indicator.dart';

class NewsView extends StatefulWidget {
  static const String routName = '/news';
    String searchQuery = ''; 

  NewsView({required this.categoryId,required this.searchQuery});
  String categoryId;
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currenIndex = 0;
  late Future<SourseResponse> getSources =
      ApiService.getSources(widget.categoryId);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSources,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingIndicator();
          } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
            return ErrorIndicator();
          } else {
            List<Source> sources = snapshot.data?.sources ?? [];
            return Column(
              children: [
                DefaultTabController(
                  length: sources.length,
                  child: TabBar(
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    indicatorColor: AppThem.white,
                    tabAlignment: TabAlignment.start,
                    labelPadding: EdgeInsetsDirectional.only(end: 16),
                    padding: EdgeInsetsDirectional.only(start: 16),
                    onTap: (index) {
                      if (currenIndex == index) return;
                      currenIndex = index;
                      setState(() {});
                    },
                    tabs: sources
                        .map(
                          (source) => TabItem(
                              sourse: source,
                              isSelected:
                                  currenIndex == sources.indexOf(source)),
                        )
                        .toList(),
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: ApiService.getNews(sources[currenIndex].id!,widget.searchQuery),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoadingIndicator();
                      } else if (snapshot.hasError ||
                          snapshot.data?.status != 'ok') {
                        return ErrorIndicator();
                      }  else {
                      List<Article> newsList = snapshot.data?.articles ??[];

                    

                      return newsList.isEmpty
                          ? Center(
                              child: Text(
                                "No news found!",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : ListView.separated(
                              padding: EdgeInsets.all(16),
                              itemBuilder: (_, index) => NewsItem(news: newsList[index]),
                              itemCount: newsList.length,
                              separatorBuilder: (_, __) => SizedBox(height: 24),
                            );
                    }
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}