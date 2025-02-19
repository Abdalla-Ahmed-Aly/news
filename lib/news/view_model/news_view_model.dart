import 'package:flutter/material.dart';
import 'package:news/news/data/data_sources/news_data_sorces.dart';
import 'package:news/news/data/models/News.dart';
import 'package:news/news/data/models/news_response.dart';

class NewsViewModel with ChangeNotifier {
  NewsDataSorces newsDataSorces = NewsDataSorces();
  List<News> newsList = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> getNews(String sourcesId,String Search) async {
    isLoading = true;
    try {
      NewsResponse response = await newsDataSorces.getNews(sourcesId,Search);
      if (response.status == 'ok' && response.NewsList != null) {
        newsList = response.NewsList ?? [];
      } else {
        errorMessage = 'Failed to get News';
      }
    } catch (eroor) {
      errorMessage = eroor.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
