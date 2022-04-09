import 'package:get/get.dart';

import '../controllers/trending_person_controller.dart';

class TrendingPersonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrendingPersonController>(
      () => TrendingPersonController(),
    );
  }
}
