import 'News.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<News>? NewsList;

  NewsResponse({this.status, this.totalResults, this.NewsList});

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        NewsList: (json['articles'] as List<dynamic>?)
            ?.map((e) => News.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
