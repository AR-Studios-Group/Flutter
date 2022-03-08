import 'package:first_app/Controllers/reactive_blue_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class ReactiveDeviceCard extends StatelessWidget {
  final DiscoveredDevice device;
  final ReactiveBlueController blueToothController;

  const ReactiveDeviceCard(
      {Key? key, required this.device, required this.blueToothController})
      : super(key: key);

  void _handleConnectToDevice() {
    blueToothController.connectToDevice(device);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.lightGreenAccent,
        ),
        child: GestureDetector(
          onTap: _handleConnectToDevice,
          child: Column(
            children: [
              Text(device.name),
              Text(device.id),
              Text('${device.rssi}')
            ],
          ),
        ));
  }
}
