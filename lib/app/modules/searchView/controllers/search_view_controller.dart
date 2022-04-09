import 'package:get/get.dart';
import 'package:tmdb/app/network/Api_Call/search_api.dart';

class SearchController extends GetxController {
  var isLoading = false.obs;
  var searchList = [].obs;


  @override
  void onInit() async {
    super.onInit();
  }
  void searchResult(query) async {
    var search = await Search().search(query);
    isLoading(true);
    try {
      if (search != null) {
        searchList.clear();
        searchList.addAll(search);
      }
    } finally {
      isLoading(false);
    }
  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
  }
}
