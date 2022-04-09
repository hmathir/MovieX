import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tmdb/app/modules/movie_by_genre/model/movie_by_genre_model.dart';
import 'package:tmdb/config.dart';

class MovieByGenreApi {

  Dio dio = Dio();

  Future<List<MovieByGenreResults>?> getMovieByGenreData(genreID) async {
    String url = '$baseUrl/discover/movie?with_genres=$genreID&$apiKey';

    try {
      var response = await dio.get(url);
      MovieByGenreModelData movieByGenreModelData = MovieByGenreModelData
          .fromJson(response.data);
      return movieByGenreModelData.results;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}