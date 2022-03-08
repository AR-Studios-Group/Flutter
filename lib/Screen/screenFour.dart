import 'package:first_app/Controllers/reactive_blue_controller.dart';
import 'package:first_app/Views/ReactiveDeviceCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenFour extends StatelessWidget {
  final blueToothController = Get.put(ReactiveBlueController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: GetX<ReactiveBlueController>(
            builder: (((controller) => ListView.builder(
                  itemCount: blueToothController.devices.length,
                  itemBuilder: (context, index) {
                    return ReactiveDeviceCard(
                        device: blueToothController.devices[index],
                        blueToothController: blueToothController);
                  },
                ))),
          ))
        ],
      ),
    );
  }
}
