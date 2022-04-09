// import 'dart:io';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tmdb/app/base/views/unused_movie_details_view.dart';
// import 'package:tmdb/app/modules/popular_movie/controllers/popular_movie_controller.dart';
//
// PopularMovieController popularMovieController = Get.find<PopularMovieController>();
//
//
// class PopularMovieSlider extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 12),
//             child: Text(
//               "What's Popular".toUpperCase(),
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black45,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         CarouselSlider.builder(
//           options: CarouselOptions(
//             enableInfiniteScroll: true,
//             autoPlay: true,
//             autoPlayInterval: Duration(seconds: 5),
//             autoPlayAnimationDuration: Duration(milliseconds: 800),
//             pauseAutoPlayOnTouch: true,
//             viewportFraction: 0.8,
//             enlargeCenterPage: true,
//           ),
//           itemCount: popularMovieController.popularMovieList.length,
//           itemBuilder:
//               (BuildContext context, int index, int realIndex) {
//
//             return GestureDetector(
//               onTap: () {
//                 Get.to(
//                       () => MovieDetailsPage(),
//                 );
//               },
//               child: Stack(
//                 alignment: Alignment.bottomLeft,
//                 children: <Widget>[
//                   ClipRRect(
//                     child: CachedNetworkImage(
//                       imageUrl:
//                       'https://image.tmdb.org/t/p/original/${popularMovieController.popularMovieList[index].posterPath}'.toString(),
//                       height: MediaQuery.of(context).size.height / 3,
//                       width: MediaQuery.of(context).size.width,
//                       fit: BoxFit.fill,
//                       placeholder: (context, url) => Platform.isAndroid
//                           ? CupertinoActivityIndicator()
//                           : CupertinoActivityIndicator(),
//                       errorWidget: (context, url, error) => Container(
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(
//                                 'assets/images/img_not_found.jpg'),
//                           ),
//                         ),
//                       ),
//                     ),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       bottom: 15,
//                       left: 15,
//                     ),
//                     child: Text(
//                       popularMovieController.popularMovieList[index].title,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }