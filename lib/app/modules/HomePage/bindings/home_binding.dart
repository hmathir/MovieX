import 'package:get/get.dart';
import 'package:tmdb/app/modules/Now_Playing/controllers/now_playing_controller.dart';
import 'package:tmdb/app/modules/movie_by_genre/controllers/movie_by_genre_controller.dart';
import 'package:tmdb/app/modules/movie_details/controllers/movie_details_controller.dart';
import 'package:tmdb/app/modules/searchView/controllers/search_view_controller.dart';
import 'package:tmdb/app/modules/trending_person/controllers/trending_person_controller.dart';
import 'package:tmdb/app/network/Api_Call/MovieByGere_api.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeController());
    Get.lazyPut(()=>MovieByGenreController());
    Get.lazyPut(()=>MovieByGenreApi());
    Get.lazyPut(()=>TrendingPersonController());
    Get.lazyPut(()=>NowPlayingController());
    Get.lazyPut(()=>MovieDetailsController());
    Get.lazyPut(()=>SearchController(), fenix: true,);

  }
}
