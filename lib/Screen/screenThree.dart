import 'package:first_app/Controllers/bluetooth_controller.dart';
import 'package:first_app/Views/DeviceCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenThree extends StatelessWidget {
  final blueToothController = Get.put(BlueToothController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: () {
              print('refreshing');
              blueToothController.searchDevices();
            },
            child: const Text(
              'Refresh Device List',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: () {
              blueToothController.checkConnectedDeivce();
            },
            child: const Text(
              'See connected device',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
            child: GetX<BlueToothController>(builder: ((controller) {
              return ListView.builder(
                itemCount: blueToothController.devices.length,
                itemBuilder: (context, index) {
                  return DeviceCard(
                      result: controller.devices[index],
                      blueToothController: blueToothController);
                },
              );
            })),
          ),
          const Text('List of connected devices'),
          Expanded(
              child: Obx((() => ListView.builder(
                    itemCount: blueToothController.connectedDevices.length,
                    itemBuilder: (context, index) {
                      return Text(
                          blueToothController.connectedDevices[index].name);
                    },
                  ))))
        ],
      ),
    );
  }
}
