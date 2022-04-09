


import 'package:dio/dio.dart';
import 'package:tmdb/app/modules/movie_details/model/movie_image.dart';
import 'package:tmdb/config.dart';

class GetMovieImageApi {

  Dio dio = Dio();
  Future<MovieImage> getMovieImage(movieID) async {
    String url = '$baseUrl/movie/$movieID/images?$apiKey';
    try {
      final response = await dio.get(url);
      return MovieImage.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception(
          'Exception: $error with stacktrace: $stacktrace');
    }
  }
}