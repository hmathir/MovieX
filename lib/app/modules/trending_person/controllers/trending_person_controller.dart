import 'package:get/get.dart';
import 'package:tmdb/app/network/Api_Call/trending_person_api.dart';

class TrendingPersonController extends GetxController {

  var trendingPersonList = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    trendingPersonController();
  }

  void trendingPersonController() async {
    isLoading(true);
    try{
      var trendingPerson = await TrendingPersonApi().getTrendingPersonData();
      if(trendingPerson != null) {
        trendingPersonList.assignAll(trendingPerson);
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
