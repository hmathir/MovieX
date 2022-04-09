import 'package:get/get.dart';

import '../modules/HomePage/bindings/home_binding.dart';
import '../modules/HomePage/views/home_view.dart';
import '../modules/Now_Playing/bindings/now_playing_binding.dart';
import '../modules/Now_Playing/views/now_playing_view.dart';
import '../modules/movie_by_genre/bindings/movie_by_genre_binding.dart';
import '../modules/movie_by_genre/views/movie_by_genre_view.dart';
import '../modules/searchView/bindings/search_view_binding.dart';
import '../modules/searchView/views/search_view_view.dart';
import '../modules/trending_person/bindings/trending_person_binding.dart';
import '../modules/trending_person/views/trending_person_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_BY_GENRE,
      page: () => MovieByGenreView(),
      binding: MovieByGenreBinding(),
    ),
    GetPage(
      name: _Paths.TRENDING_PERSON,
      page: () => TrendingPersonView(),
      binding: TrendingPersonBinding(),
    ),
    GetPage(
      name: _Paths.NOW_PLAYING,
      page: () => NowPlayingView(),
      binding: NowPlayingBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_VIEW,
      page: () => SearchView(),
      binding: SearchViewBinding(),
    ),
  ];
}
