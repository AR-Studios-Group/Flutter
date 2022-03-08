import 'package:first_app/Controllers/bluetooth_controller.dart';
import 'package:first_app/Screen/BlueDevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class DeviceCard extends StatelessWidget {
  final ScanResult result;
  final BlueToothController blueToothController;

  const DeviceCard(
      {Key? key, required this.result, required this.blueToothController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          color: blueToothController.connectedDevices.contains(result.device)
              ? Colors.greenAccent
              : Colors.pinkAccent,
        ),
        child: GestureDetector(
          onTap: () {
            print('Pressed');
            Get.to(BlueDevice(device: result.device));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Deive name: ${result.device.name}'),
              Text('Device type: ${result.device.type.name}'),
              Text('Singal strenght: ${result.rssi}'),
            ],
          ),
        )));
  }
}
