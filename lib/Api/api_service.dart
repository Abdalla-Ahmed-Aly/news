import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/Api/api_cons.dart';
import 'package:news/models/news_response/news_response.dart';
import 'package:news/models/sourse_response/sourse_response.dart';

class ApiService {
  static Future<SourseResponse> getSources(String categoryId) async {
    Uri uri = Uri.https(
      ApiCons.baseURL,
      ApiCons.EndBoint,
      {
        'apiKey': ApiCons.apiKey,
        'category': categoryId,
      },
    );
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return SourseResponse.fromJson(json);
  }

 static Future<NewsResponse> getNews(String sourcesId) async {
    Uri uri = Uri.https(
      ApiCons.baseURL,
      ApiCons.newsEndBoint,
      {
        'apiKey': ApiCons.apiKey,
        'sources': sourcesId,
      },
    );
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
//  static Future<NewsResponse> SearchNews(String Search) async {
//     Uri uri = Uri.https(
//       ApiCons.baseURL,
//       ApiCons.SerchEndBoint,
//       {
//         'apiKey': ApiCons.apiKey,
//         'q': Search,
//       },
//     );
//     http.Response response = await http.get(uri);
//     Map<String, dynamic> json = jsonDecode(response.body);
//     return NewsResponse.fromJson(json);
//   }
}
