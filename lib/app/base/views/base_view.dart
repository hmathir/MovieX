// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:tmdb/app/modules/HomePage/views/NoInternetView.dart';
// import 'package:tmdb/app/modules/HomePage/views/home_view.dart';
// import 'package:tmdb/app/modules/Now_Playing/controllers/now_playing_controller.dart';
//
// import '../controllers/base_controller.dart';
//
// class BaseView extends GetView<BaseController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx((){
//         Loading
//         return controller.connectionStatus.value == 1 ? HomeView() : SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: EmptyFailureNoInternetView(
//               image: 'lottie/no_internet_lottie.json',
//               onPressed: () {
//                 NowPlayingController().nowPlayingMovieList;
//               },
//               description: 'Internet Not Found',
//               buttonText: 'Retry',
//               title: 'Network Error'));})
//     );
//   }
// }
