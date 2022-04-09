import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tmdb/app/modules/movie_details/model/movie_details_cast_model.dart';
import 'package:tmdb/config.dart';

class CreditsApi {
  Dio dio = Dio();

  Future<List<Cast>?> getCreditsData(int movieID) async {
    String url = '$baseUrl/movie/$movieID/credits?$apiKey';
    try {
      Response response = await dio.get(url);
      MovieCreditsModelData movieCreditsModelData =
          MovieCreditsModelData.fromJson(response.data);
      return movieCreditsModelData.cast;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}
