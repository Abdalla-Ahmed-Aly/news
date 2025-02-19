import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/Api/api_cons.dart';
import 'package:news/news/data/models/news_response.dart';

class NewsDataSorces {
   Future<NewsResponse> getNews(
    String sourcesId,
    String? Search,
    // int page
  ) async {
    Uri uri = Uri.https(
      ApiCons.baseURL,
      ApiCons.newsEndBoint,
      {
        'apiKey': ApiCons.apiKey,
        'sources': sourcesId,
        if (Search != null && Search.isNotEmpty) 'q': Search,
        'pageSize': '3',
        // 'page': page.toString(), 
      },
    );
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}