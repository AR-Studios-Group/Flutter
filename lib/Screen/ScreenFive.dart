import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenFive extends StatelessWidget {
  const ScreenFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Five'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Get.snackbar('Title', 'Message');
            },
            child: const Text('Open Snackbar'),
          ),
          TextButton(
            onPressed: () {
              Get.defaultDialog(title: 'Dialog', middleText: 'dialog box');
            },
            child: const Text('Open Dialog'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Go Back'),
          )
        ],
      )),
    );
  }
}
