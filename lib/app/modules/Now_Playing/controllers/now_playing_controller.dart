import 'package:get/get.dart';
import 'package:tmdb/app/network/Api_Call/now_playing_movie.dart';

class NowPlayingController extends GetxController {
  var isLoading = false.obs;
  var nowPlayingMovieList = [].obs;



  @override
  void onInit() {
    super.onInit();
    nowPlayingMovieController();
  }

  void nowPlayingMovieController() async {
    isLoading(true);
    try{
      var movie = await NowPlayingMovieAPI().getNowPlayingMovie();
      if(movie != null){
        nowPlayingMovieList.assignAll(movie);
      }
    } finally {isLoading(false);}
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
