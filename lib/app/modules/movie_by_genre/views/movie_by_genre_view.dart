import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/modules/movie_details/controllers/movie_details_controller.dart';
import 'package:tmdb/app/modules/movie_details/views/movie_details_view.dart';
import '../controllers/movie_by_genre_controller.dart';

class MovieByGenreView extends GetView<MovieByGenreController> {
  @override
  Widget build(BuildContext context) {
    MovieDetailsController movieDetailsController = Get.find<MovieDetailsController>();
    var movieID;
    var genreID = 28;
    return Obx(() {
      // if (controller.isLoading.value) {
      //   return Container(
      //     height: 397,
      //     child: Center(
      //       child: Platform.isAndroid
      //           ? CupertinoActivityIndicator()
      //           : CupertinoActivityIndicator(),
      //     ),
      //   );
      // }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 18,
              ),
              Container(
                height: 45,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      VerticalDivider(
                    color: Colors.transparent,
                    width: 5,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.genreList.length,
                  itemBuilder: (context, index) {
                    var genreItem = controller.genreList[index];
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            genreID = genreItem.id;
                            controller.getMovieByGenreController(genreID);
                          },
                          // Put Genre ID on MovieByGenre Controller for filtering genre wise movie
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black45,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                              color: (genreItem.id == genreID)
                                  ? Colors.black45
                                  : Colors.white,
                            ),
                            child: Text(
                              genreItem.name.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: (genreItem.id == genreID)
                                    ? Colors.white
                                    : Colors.black45,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              'Trending Movie By Genre'.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 300,
            child: ListView.separated(
              separatorBuilder: (context, index) => VerticalDivider(
                color: Colors.transparent,
                width: 15,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: controller.genreMoviesList.length,
              itemBuilder: (context, index) {
                var item = controller.genreMoviesList[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    GestureDetector(
                      onTap: () {
                        movieID = item.id;
                        movieDetailsController.movieDetailsController(movieID);
                        Get.to(
                              () => MovieDetailsPage(),
                        );
                      },
                      child: ClipRRect(
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://image.tmdb.org/t/p/original/${item.backdropPath}'
                                  .toString(),
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              width: 180,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          placeholder: (context, url) => Container(
                            width: 180,
                            height: 250,
                            child: Center(
                              child: Platform.isAndroid
                                  ? CupertinoActivityIndicator()
                                  : CupertinoActivityIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: 180,
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/img_not_found.jpg'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 180,
                      child: Text(
                        item.title.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    RatingBar.builder(
                      unratedColor: Colors.black,
                      initialRating: controller
                          .genreMoviesList[index].voteAverage
                          .toDouble(),
                      minRating: 1,
                      maxRating: 10,
                      itemSize: 15,
                      ignoreGestures: true,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 10,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
