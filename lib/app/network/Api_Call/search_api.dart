import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tmdb/app/modules/searchView/model/search_model.dart';
import 'package:tmdb/config.dart';

class Search {
  Dio dio = Dio();

  Future<List<SearchResults>?> search(query) async {
    String url = '$baseUrl/search/movie?query=$query&$apiKey';
    try {
      Response response = await dio.get(url);
      SearchModel searchModel = SearchModel
          .fromJson(response.data);
      return searchModel.results;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}