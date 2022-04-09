// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/modules/movie_details/model/movie_details_cast_model.dart';
import 'package:tmdb/app/modules/movie_details/model/movie_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tmdb/app/modules/movie_details/controllers/movie_details_controller.dart';

class MovieDetailsPage extends GetView<MovieDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
              child: Platform.isAndroid
                  ? CupertinoActivityIndicator()
                  : CupertinoActivityIndicator());
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
                  // ClipPath(
                  //   child: ClipRRect(
                  //     child: Image.network(
                  //       'https://image.tmdb.org/t/p/original/${controller.movieDetailsModelData!.backdropPath}'
                  //           .toString(),
                  //       height: MediaQuery.of(context).size.height / 2,
                  //       width: double.infinity,
                  //       fit: BoxFit.cover,
                  //       loadingBuilder: (BuildContext context, Widget child,
                  //           ImageChunkEvent? loadingProgress) {
                  //         if (loadingProgress == null) {
                  //           return Center(child: child);
                  //         }
                  //         return Center(
                  //             child: Platform.isAndroid
                  //                 ? CupertinoActivityIndicator()
                  //                 : CupertinoActivityIndicator());
                  //       },
                  //       errorBuilder: (context, url, error) => Container(
                  //         decoration: BoxDecoration(
                  //           image: DecorationImage(
                  //             image:
                  //                 AssetImage('assets/images/img_not_found.jpg'),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     borderRadius: BorderRadius.only(
                  //       bottomLeft: Radius.circular(30),
                  //       bottomRight: Radius.circular(30),
                  //     ),
                  //   ),
                  // ),
                  ClipPath(
                    child: ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/original/${controller.movieDetailsModelData!.backdropPath}'
                                .toString(),
                        height: MediaQuery.of(context).size.height / 2,
                        width: double.infinity,
                        fit: BoxFit.cover,
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
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 120),
                        child: GestureDetector(
                          onTap: () async {
                            final youtubeUrl =
                                'https://www.youtube.com/embed/${controller.movieDetailsModelData!.trailerId}';
                            if (await canLaunch(youtubeUrl)) {
                              await launch(youtubeUrl);
                            }
                          },
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.play_circle_outline,
                                  color: Colors.yellow,
                                  size: 65,
                                ),
                                Text(
                                  controller.movieDetailsModelData!.title
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 160,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Overview'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 35,
                              child: Text(
                                controller.movieDetailsModelData!.overview
                                    .toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Release date'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'muli',
                                          ),
                                    ),
                                    Text(
                                      controller
                                          .movieDetailsModelData!.releaseDate
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                            color: Colors.yellow[800],
                                            fontSize: 12,
                                            fontFamily: 'muli',
                                          ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'run time'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'muli',
                                          ),
                                    ),
                                    //TODO add RunTime!
                                    Text(
                                      controller.movieDetailsModelData!.runtime
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                            color: Colors.yellow[800],
                                            fontSize: 12,
                                          ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'budget'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'muli',
                                          ),
                                    ),
                                    //TODO add Budget!
                                    Text(
                                      controller.movieDetailsModelData!
                                                  .budget ==
                                              0
                                          ? 'No Data'
                                          : controller
                                              .movieDetailsModelData!.budget
                                              .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                            color: Colors.yellow[800],
                                            fontSize: 12,
                                            fontFamily: 'muli',
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Screenshots'.toUpperCase(),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'muli',
                                      ),
                            ),
                            Container(
                              height: 155,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    VerticalDivider(
                                  color: Colors.transparent,
                                  width: 5,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.movieDetailsModelData!
                                    .movieImage!.backdrops!.length,
                                itemBuilder: (context, index) {
                                  Screenshot image = controller
                                      .movieDetailsModelData!
                                      .movieImage!
                                      .backdrops![index];
                                  return Container(
                                    child: Card(
                                      elevation: 3,
                                      borderOnForeground: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          placeholder: (context, url) => Center(
                                            child: Platform.isAndroid
                                                ? CupertinoActivityIndicator()
                                                : CupertinoActivityIndicator(),
                                          ),
                                          imageUrl:
                                              'https://image.tmdb.org/t/p/w500${image.filePath}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Casts'.toUpperCase(),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'muli',
                                      ),
                            ),
                            Container(
                              height: 110,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    VerticalDivider(
                                  color: Colors.transparent,
                                  width: 5,
                                ),
                                itemCount: controller
                                    .movieDetailsModelData!.castList!.length,
                                itemBuilder: (context, index) {
                                  Cast cast = controller
                                      .movieDetailsModelData!.castList![index];
                                  return Container(
                                    child: Column(
                                      children: <Widget>[
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          elevation: 3,
                                          child: ClipRRect(
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://image.tmdb.org/t/p/w200${cast.profilePath}',
                                              imageBuilder:
                                                  (context, imageBuilder) {
                                                return Container(
                                                  width: 80,
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                100)),
                                                    image: DecorationImage(
                                                      image: imageBuilder,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                );
                                              },
                                              placeholder: (context, url) =>
                                                  Container(
                                                width: 80,
                                                height: 80,
                                                child: Center(
                                                  child: Platform.isAndroid
                                                      ? CupertinoActivityIndicator()
                                                      : CupertinoActivityIndicator(),
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                width: 80,
                                                height: 80,
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
                                        Container(
                                          child: Center(
                                            child: Text(
                                              cast.name.toString(),
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 8,
                                                fontFamily: 'muli',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text(
                                              cast.character.toString(),
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 8,
                                                fontFamily: 'muli',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }
}
