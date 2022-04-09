import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/modules/HomePage/constant.dart';
import 'package:tmdb/app/modules/HomePage/controllers/home_controller.dart';
import 'package:tmdb/app/modules/Now_Playing/views/now_playing_view.dart';
import 'package:tmdb/app/modules/movie_by_genre/views/movie_by_genre_view.dart';
import 'package:tmdb/app/modules/trending_person/views/trending_person_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
        appBar: appBar, //Check constant.dart if you want to edit AppBar
        body:  SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NowPlayingView(),
                  MovieByGenreView(),
                  TrendingPersonView(),
                ],
              ),
            ),
          ));
  }
}
