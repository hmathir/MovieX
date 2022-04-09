import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tmdb/app/modules/trending_person/model/trending_person_model.dart';
import 'package:tmdb/config.dart';

class TrendingPersonApi {

  Dio dio = Dio();

  Future<List<TrendingPersonResults>?> getTrendingPersonData() async {
    String url = '$baseUrl/trending/person/day?$apiKey';

    try {
      Response response = await dio.get(url);
      TrendingPersonModelData trendingPersonModelData = TrendingPersonModelData.fromJson(response.data);
      return trendingPersonModelData.results;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}