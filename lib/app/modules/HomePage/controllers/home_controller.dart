import 'package:get/get.dart';


class HomeController extends GetxController {
  // var isLoading = false.obs;
  // var connectionStatus = 1.obs;
  // late StreamSubscription<InternetConnectionStatus> listener;

  @override
  void onInit() async {
    super.onInit();
    // listener = InternetConnectionChecker().onStatusChange.listen((
    //     InternetConnectionStatus status) {
    //   switch (status) {
    //     case InternetConnectionStatus.connected:
    //       connectionStatus.value = 1;
    //       break;
    //     case InternetConnectionStatus.disconnected:
    //       connectionStatus.value = 0;
    //       break;
    //   }
    // });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // listener.cancel();
  }
}
