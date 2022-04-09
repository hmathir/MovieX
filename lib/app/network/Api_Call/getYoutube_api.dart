import 'package:dio/dio.dart';
import 'package:tmdb/config.dart';

class GetYoutubeApi {

  Dio dio = Dio();

  Future<String> getYoutubeApiData(movieID) async {
    String url = '$baseUrl/movie/$movieID/videos?$apiKey';

    try {
      final response = await dio.get(url);
      var youtubeId = response.data['results'][0]['key'];
      return youtubeId;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception: $error with stacktrace: $stacktrace');
    }

  }
}