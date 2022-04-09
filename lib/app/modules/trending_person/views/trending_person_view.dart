import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/trending_person_controller.dart';


class TrendingPersonView extends GetView<TrendingPersonController> {
  @override
  Widget build(BuildContext context) {
    return Obx((){
      if (controller.isLoading.value) {
        return Center(
            child: Platform.isAndroid
                ? CupertinoActivityIndicator()
                : CupertinoActivityIndicator());
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending persons on this week'.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black45,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            children: <Widget>[
              Container(
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.trendingPersonList.length,
                  separatorBuilder:
                      (context, index) =>
                      VerticalDivider(
                        color: Colors.transparent,
                        width: 5,
                      ),
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          Card(
                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(
                                  100),
                            ),
                            elevation: 3,
                            child: ClipRRect(
                              child:
                              CachedNetworkImage(
                                imageUrl:
                                'https://image.tmdb.org/t/p/w200${controller.trendingPersonList[index].profilePath}'.toString(),
                                imageBuilder: (context,
                                    imageProvider) {
                                  return Container(
                                    width: 80,
                                    height: 80,
                                    decoration:
                                    BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .all(
                                        Radius
                                            .circular(
                                            100),
                                      ),
                                      image:
                                      DecorationImage(
                                        image:
                                        imageProvider,
                                        fit: BoxFit
                                            .cover,
                                      ),
                                    ),
                                  );
                                },
                                placeholder:
                                    (context,
                                    url) =>
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: Center(
                                        child: Platform
                                            .isAndroid
                                            ? CupertinoActivityIndicator()
                                            : CupertinoActivityIndicator(),
                                      ),
                                    ),
                                errorWidget:
                                    (context, url,
                                    error) =>
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration:
                                      BoxDecoration(
                                        image:
                                        DecorationImage(
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
                                controller.trendingPersonList[index].name.toString(),
                                style: TextStyle(
                                  color: Colors
                                      .black87,
                                  fontSize: 12,
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
        ],
      );});
  }
}
