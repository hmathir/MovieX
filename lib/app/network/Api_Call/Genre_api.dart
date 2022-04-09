import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tmdb/app/modules/movie_by_genre/model/genre_model.dart';
import 'package:tmdb/config.dart';

class GenreApi {
  Dio dio = Dio();

  Future<List<GenreResult>?> getGenreData() async {
    String url = '$baseUrl/genre/movie/list?$apiKey&language=en-US';
    try {
      Response response = await dio.get(url);
      GenreModelData genreModelData = GenreModelData
          .fromJson(response.data);
      return genreModelData.genres;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}