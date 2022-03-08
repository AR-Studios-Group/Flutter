import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:get/get.dart';

class ReactiveBlueController extends GetxController {
  FlutterReactiveBle flutterReactiveBle = FlutterReactiveBle();

  var devices = <DiscoveredDevice>[].obs;
  var devicesId = <String>[];

  void searchDevice() {
    flutterReactiveBle.scanForDevices(
        withServices: [], scanMode: ScanMode.lowLatency).listen((device) {
      if (!devicesId.contains(device.id) && device.name != '') {
        devices.add(device);
        devicesId.add(device.id);
      }
    });
  }

  void connectToDevice(DiscoveredDevice device) {
    flutterReactiveBle
        .connectToDevice(
      id: device.id,
      connectionTimeout: const Duration(seconds: 2),
    )
        .listen((connectionState) {
      print(connectionState.connectionState);
    }, onError: () {
      print('Error in connecting to deivce');
    });
  }

  @override
  void onInit() {
    super.onInit();
    searchDevice();
  }
}
