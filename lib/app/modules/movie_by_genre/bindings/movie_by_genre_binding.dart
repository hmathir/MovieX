import 'package:get/get.dart';
import '../controllers/movie_by_genre_controller.dart';

class MovieByGenreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieByGenreController>(
      () => MovieByGenreController(),
    );
  }
}
