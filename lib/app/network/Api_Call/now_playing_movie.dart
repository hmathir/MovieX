import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tmdb/app/modules/Now_Playing/model/now_playing.dart';
import 'package:tmdb/config.dart';

class NowPlayingMovieAPI {

  Dio dio = Dio();

  Future<List<Movie>?> getNowPlayingMovie() async {
    String url = '$baseUrl/movie/now_playing?$apiKey';
    try {
      Response response = await dio.get(url);
      NowPlayingMovieModel nowPlayingMovieModel = NowPlayingMovieModel.fromJson(response.data);
      return nowPlayingMovieModel.results;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}