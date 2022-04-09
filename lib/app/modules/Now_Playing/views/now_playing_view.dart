import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/modules/movie_details/controllers/movie_details_controller.dart';
import 'package:tmdb/app/modules/movie_details/views/movie_details_view.dart';
import 'package:tmdb/app/modules/Now_Playing/controllers/now_playing_controller.dart';

class NowPlayingView extends GetView<NowPlayingController> {
  @override
  Widget build(BuildContext context) {
    MovieDetailsController movieDetailsController = Get.find<MovieDetailsController>();
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          heightFactor: MediaQuery.of(context).size.height,
            child: Platform.isAndroid
                ? CupertinoActivityIndicator()
                : CupertinoActivityIndicator());
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Now Playing".toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CarouselSlider.builder(
            options: CarouselOptions(
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              pauseAutoPlayOnTouch: true,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
            ),
            itemCount: controller.nowPlayingMovieList.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              var movie = controller.nowPlayingMovieList[index].id;
              var item = controller.nowPlayingMovieList[index];
              return GestureDetector(
                //TODO
                onTap: () {
                  movieDetailsController.movieDetailsController(movie);
                  Get.to(
                    () => MovieDetailsPage(),
                  );
                },
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/original/${item.posterPath}',
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Platform.isAndroid
                            ? CupertinoActivityIndicator()
                            : CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/img_not_found.jpg'),
                            ),
                          ),
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      );
    });
  }
}
