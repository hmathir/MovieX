
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tmdb/app/modules/HomePage/controllers/home_controller.dart';

class EmptyFailureNoInternetView extends GetView<HomeController> {
  EmptyFailureNoInternetView(
      {required this.image,
        required this.title,
        required this.description,
        required this.buttonText,
        required this.onPressed});

  final String title, description, buttonText, image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset(
                image,
                height: 250,
                width: 250,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 8,
              ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
                buttonText,
                style:
                TextStyle( color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14 )

            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                elevation: 10,
                padding: EdgeInsets.only(
                    left: 14, right: 14, top: 14, bottom: 14)),
          ),
            ],
          ),
        ),
      ),
    );
  }
}