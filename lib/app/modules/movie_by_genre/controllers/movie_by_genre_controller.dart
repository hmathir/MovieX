import 'package:get/get.dart';
import 'package:tmdb/app/network/Api_Call/Genre_api.dart';
import 'package:tmdb/app/network/Api_Call/MovieByGere_api.dart';

class MovieByGenreController extends GetxController {
  var genreList = [].obs;
  var genreMoviesList = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMovieByGenreController(28);
    genreController();

  }

  void getMovieByGenreController(int genreID) async {
    isLoading(true);
    try{
      var genreMovies = await MovieByGenreApi().getMovieByGenreData(genreID);
      if(genreMovies != null){
        genreMoviesList.clear();
        genreMoviesList.assignAll(genreMovies);

      }
    } finally {isLoading(false);}
  }

  void genreController() async {
    isLoading(true);
    try{
      var genre = await GenreApi().getGenreData();
      if(genre != null) {
        genreList.assignAll(genre);
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
