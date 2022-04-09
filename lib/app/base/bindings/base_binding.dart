import 'package:get/get.dart';
import 'package:tmdb/app/base/controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>BaseController());

  }
}
