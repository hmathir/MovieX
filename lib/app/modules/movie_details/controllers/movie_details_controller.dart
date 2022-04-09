import 'package:get/get.dart';
import 'package:tmdb/app/modules/movie_details/model/movie_details_model.dart';
import 'package:tmdb/app/network/Api_Call/movie_details_api.dart';

class MovieDetailsController extends GetxController {
  var isLoading = false.obs;
  MovieDetailsModelData? movieDetailsModelData;

  @override
  void onInit() {
    super.onInit();
  }

  void movieDetailsController(movieID) async {
    isLoading(true);
    try {
      movieDetailsModelData = (await MovieDetailsApi().getMovieDetailsData(movieID))!;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
