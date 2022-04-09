import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/app/modules/movie_details/model/movie_details_model.dart';
import 'package:tmdb/app/network/Api_Call/cast_api.dart';
import 'package:tmdb/app/network/Api_Call/getYoutube_api.dart';
import 'package:tmdb/app/network/Api_Call/get_movie_image.dart';
import 'package:tmdb/config.dart';

class MovieDetailsApi {
  Future<MovieDetailsModelData?> getMovieDetailsData(movieID) async {

    Dio dio = Dio();
    String url = '$baseUrl/movie/$movieID?$apiKey';
    try {
      Response response = await dio.get(url);
        MovieDetailsModelData movieModel = MovieDetailsModelData.fromJson(
            response.data);
      movieModel.trailerId =  await GetYoutubeApi().getYoutubeApiData(movieID);
      movieModel.castList = await CreditsApi().getCreditsData(movieID);
      movieModel.movieImage = await GetMovieImageApi().getMovieImage(movieID);
        return movieModel;

    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}