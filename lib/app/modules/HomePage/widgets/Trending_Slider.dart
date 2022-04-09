// import 'dart:io';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:tmdb/app/modules/HomePage/controllers/home_controller.dart';
// import 'package:tmdb/app/modules/HomePage/views/home_view.dart';
//
//
//
// class TrendingMovieSlider extends StatelessWidget {
//   const TrendingMovieSlider({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);
//
//   final HomeController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             child: Text(
//               'Trending'.toUpperCase(),
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black45,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             height: 300,
//             child: ListView.separated(
//               separatorBuilder: (context, index) =>
//                   VerticalDivider(
//                     color: Colors.transparent,
//                     width: 15,
//                   ),
//               scrollDirection: Axis.horizontal,
//               itemCount: trendingMovieController.trendingMovieList.length,
//               itemBuilder: (context, index) {
//                 var item = trendingMovieController.trendingMovieList[index];
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     GestureDetector(
//                       // onTap: ()
//                       // {
//                       //   Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //       builder: (context) =>
//                       //           MovieDetailScreen(movie: movie),
//                       //     ),
//                       //   );
//                       // },
//                       child: ClipRRect(
//                         child: CachedNetworkImage(
//                           imageUrl:
//                           'https://image.tmdb.org/t/p/original/${item.backdropPath}'.toString(),
//                           imageBuilder:
//                               (context, imageProvider) {
//                             return Container(
//                               width: 180,
//                               height: 250,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(12),
//                                 ),
//                                 image: DecorationImage(
//                                   image: imageProvider,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             );
//                           },
//                           placeholder: (context, url) =>
//                               Container(
//                                 width: 180,
//                                 height: 250,
//                                 child: Center(
//                                   child: Platform.isAndroid
//                                       ? CircularProgressIndicator()
//                                       : CupertinoActivityIndicator(),
//                                 ),
//                               ),
//                           errorWidget: (context, url, error) =>
//                               Container(
//                                 width: 180,
//                                 height: 250,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/img_not_found.jpg'),
//                                   ),
//                                 ),
//                               ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       width: 180,
//                       child: Text(
//                         item.title.toString(),
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.black45,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     RatingBar.builder(
//                       unratedColor: Colors.black,
//                       initialRating: trendingMovieController
//                           .trendingMovieList[index].voteAverage,
//                       minRating: 1,
//                       maxRating: 10,
//                       itemSize: 15,
//                       ignoreGestures: true,
//                       direction: Axis.horizontal,
//                       allowHalfRating: true,
//                       itemCount: 10,
//                       itemPadding:
//                       EdgeInsets.symmetric(horizontal: 1),
//                       itemBuilder: (context, _) => Icon(
//                         Icons.star,
//                         color: Colors.amber,
//                       ),
//                       onRatingUpdate: (rating) {
//                         print(rating);
//                       },
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }