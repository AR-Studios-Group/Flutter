import 'package:first_app/Controllers/bluetooth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class BlueDevice extends StatelessWidget {
  final BlueToothController blueToothController = Get.find();
  final FlutterBlue flutterBlue = FlutterBlue.instance;

  final BluetoothDevice device;

  BlueDevice({Key? key, required this.device}) : super(key: key);

  Future<List<BluetoothService>> handleGetServices() async {
    if (blueToothController.connectedDevices.contains(device)) {
      List<BluetoothService> services = await device.discoverServices();
      print(services.length);
      return services;
    } else {
      return <BluetoothService>[];
    }
  }

  List<BluetoothService> services = [];

  @override
  Widget build(BuildContext context) {
    handleGetServices().then((value) {
      services = value;
    });
    return Scaffold(
        appBar: AppBar(
          title: Text(device.name),
          foregroundColor: Colors.black,
          backgroundColor: Colors.lightGreenAccent,
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Text(
                  'Status: ${blueToothController.connectedDevices.contains(device) ? 'CONNECTED' : 'NOT CONNECTED'}')),
              TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pinkAccent)),
                onPressed: () {
                  if (blueToothController.connectedDevices.contains(device)) {
                    blueToothController.disconnectFromDevice(device);
                  } else {
                    blueToothController.connectToDevice(device);
                  }
                },
                child: Obx(() => Text(
                      blueToothController.connectedDevices.contains(device)
                          ? 'DISCONNECT'
                          : 'CONNECT',
                      style: const TextStyle(color: Colors.black),
                    )),
              ),
              TextButton(
                  onPressed: () {
                    if (blueToothController.connectedDevices.contains(device)) {
                      blueToothController.discoverServices(device);
                    } else {
                      print('Device not connected');
                    }
                  },
                  child: const Text('Services')),
              ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return Text(
                    "Service UUID${services[index].isPrimary}",
                    style: TextStyle(color: Colors.black),
                  );
                },
              )
            ],
          ),
        ));
  }
}
