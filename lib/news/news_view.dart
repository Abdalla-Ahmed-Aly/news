import 'package:flutter/material.dart';
import 'package:news/app_them.dart';
import 'package:news/news/data/models/News.dart';
import 'package:news/news/news_item.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/sources/view/widget/tab_item.dart';
import 'package:news/sources/view_model/sources_view_model.dart';
import 'package:news/widget/error_indicator.dart';
import 'package:news/widget/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:news/sources/data/models/source.dart';

class NewsView extends StatefulWidget {
  static const String routName = '/news';
  String searchQuery = '';

  NewsView({required this.categoryId, required this.searchQuery});
  String categoryId;
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currenIndex = 0;
  SourcesViewModel viewModel = SourcesViewModel();
  NewsViewModel newsViewModel = NewsViewModel();
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    viewModel.getSorces(widget.categoryId);
    scrollController.addListener(LoadMoreDate);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (_, value, __) {
          if (value.isLoading) {
            return LoadingIndicator();
          } else if (value.errorMessage != null) {
            return ErrorIndicator('failed');
          } else {
            List<Source> sources = viewModel.sources;
            newsViewModel.getNews(sources[currenIndex].id!, widget.searchQuery);
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
                  child: ChangeNotifierProvider(
                    create: (_) => newsViewModel,
                    child: Consumer<NewsViewModel>(
                      builder: (_, ViewModel, __) {
                        if (ViewModel.isLoading) {
                          return LoadingIndicator();
                        } else if (ViewModel.errorMessage != null) {
                          return ErrorIndicator('no news');
                        } else {
                          List<News> newsList = ViewModel.newsList;
                          return ListView.separated(
                            padding: EdgeInsets.all(16),
                            controller: scrollController,
                            itemBuilder: (_, index) =>
                                NewsItem(news: newsList[index]),
                            itemCount: newsList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 24),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  void LoadMoreDate() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {}
  }
}
