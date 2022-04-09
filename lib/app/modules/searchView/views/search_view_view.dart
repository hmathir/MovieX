import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/modules/movie_details/controllers/movie_details_controller.dart';
import 'package:tmdb/app/modules/movie_details/views/movie_details_view.dart';
import '../controllers/search_view_controller.dart';

class SearchView extends GetView<SearchController> {
  @override

  Widget build(BuildContext context) {
    MovieDetailsController movieDetailsController = Get.find<MovieDetailsController>();

    String? searchQuery;
    return Scaffold(
      appBar: AppBar(title: Text('Search'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              SizedBox(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            searchQuery = value;
                          },
                          decoration: const InputDecoration(
                            hintText: "Search for a Movie...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.searchResult(searchQuery);
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.black45,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Obx(
                      () => controller.isLoading.value
                      ? Container()
                      : ListView.builder(
                    itemCount: controller.searchList.length,
                    itemBuilder: (context, index) {
                      var id = controller.searchList[index].id;
                      return GestureDetector(
                        onTap: () {
                          movieDetailsController.movieDetailsController(id);
                          Get.to(
                                () => MovieDetailsPage(),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CachedNetworkImage(imageUrl: 'https://image.tmdb.org/t/p/w200/${controller.searchList[index].backdropPath}'
                                    .toString()),
                              ),
                              Expanded(flex: 2,child: Text(controller.searchList[index].title.toString()))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
