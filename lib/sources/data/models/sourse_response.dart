import 'source.dart';

class SourseResponse {
  String? status;
  List<Source>? sources;

  SourseResponse({this.status, this.sources});

  factory SourseResponse.fromJson(Map<String, dynamic> json) {
    return SourseResponse(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
