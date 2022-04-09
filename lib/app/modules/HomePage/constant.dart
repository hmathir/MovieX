import 'package:flutter/material.dart';

 AppBar appBar = AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  leading: Icon(
    Icons.menu,
    color: Colors.black45,
  ),
  title: Text(
    'MovieX',
    style: TextStyle(
      color: Colors.black45,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  actions: [
    // IconButton(onPressed: (){
    //   Get.to(() => SearchView());
    // }, icon: Icon(Icons.search, color: Colors.black45,))
     Container(
      margin: EdgeInsets.only(right: 15),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/img_not_found.jpg'),
      ),
    ),
  ],
);