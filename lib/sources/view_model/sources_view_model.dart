import 'package:flutter/material.dart';
import 'package:news/sources/data/data_sources/sources_data_source.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:news/sources/data/models/sourse_response.dart';

class SourcesViewModel with ChangeNotifier {
  SourcesDataSource dataSource = SourcesDataSource();
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage ;
  Future<void> getSorces(String categoryId) async {
    isLoading = true;
    try {
      SourseResponse response = await dataSource.getSources(categoryId);
      if (response.status == 'ok' ) {
        sources = response.sources!;
      } else {
        errorMessage = 'Failed to get sources';
      }
    } catch (eroor) {
      errorMessage = eroor.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
