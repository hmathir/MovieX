import 'dart:io';
import 'package:flutter/cupertino.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Platform.isAndroid
            ? const CupertinoActivityIndicator()
            : const CupertinoActivityIndicator()
    );
  }
}
