import 'dart:convert';

import 'package:news/Api/api_cons.dart';
import 'package:news/sources/data/models/sourse_response.dart';
import 'package:http/http.dart' as http;

class SourcesDataSource {
    Future<SourseResponse> getSources(String categoryId) async {
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
}
