// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tmdb/app/modules/movie_by_genre/controllers/movie_by_genre_controller.dart';
// import 'package:tmdb/app/network/MovieByGere_api.dart';
//
// MovieByGenreController movieByGenreController = Get.find<MovieByGenreController>();
// var genreID;
// class GenreListWidgets extends StatelessWidget {
//    GenreListWidgets({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 18,),
//         Container(
//             height: 45,
//             child: ListView.separated(
//               separatorBuilder:
//                   (BuildContext context, int index) =>
//                   VerticalDivider(
//                     color: Colors.transparent,
//                     width: 5,
//                   ),
//               scrollDirection: Axis.horizontal,
//               itemCount: genreListController.genreList.length,
//               itemBuilder: (context, index) {
//                 var genreItem =
//                 genreListController.genreList[index];
//                 return Column(
//                   children: <Widget>[
//                     GestureDetector(
//                       onTap: () {
//                         genreID = genreItem.id;
//                         movieByGenreController.getMovieByGenreController(genreID);
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.black45,
//                           ),
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(25),
//                           ),
//                           color: (genreItem.id == genreID)
//                               ? Colors.black45
//                               : Colors.white,
//                         ),
//                         child: Text(
//                           genreItem.name.toString(),
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: (genreItem.id == genreID)
//                                 ? Colors.white
//                                 : Colors.black45,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//         ),
//       ],
//     );
//   }
// }