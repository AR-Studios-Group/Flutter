import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

// Flutter Blue

class BlueToothController extends GetxController {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  var devices = <ScanResult>[].obs;
  var connectedDevices = <BluetoothDevice>[].obs;

  void searchDevices() {
    for (BluetoothDevice d in connectedDevices) {
      d.disconnect();
    }

    devices.clear();

    flutterBlue.startScan(timeout: const Duration(seconds: 5));
    flutterBlue.scanResults.listen((results) {
      for (ScanResult r in results) {
        if (!devices.contains(r) && r.device.name != '') {
          devices.add(r);
        }
      }
    });

    flutterBlue.stopScan();
  }

  void connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect(timeout: const Duration(seconds: 10));
      connectedDevices.add(device);
      print('device connected');
    } catch (identifier) {
      print('connect to device error');
    }
  }

  void disconnectFromDevice(BluetoothDevice device) async {
    try {
      await device.disconnect();
      connectedDevices.remove(device);
      print('device disconnected');
    } catch (identifier) {
      print('disconnect to device error');
    }
  }

  void discoverServices(BluetoothDevice device) async {
    try {
      List<BluetoothService> services = await device.discoverServices();
      for (var service in services) {
        print(service.deviceId);
      }
    } catch (identifier) {
      print('discover service error');
    }
  }

  void checkConnectedDeivce() async {
    try {
      connectedDevices.clear();
      List<BluetoothDevice> devicesConnected =
          await flutterBlue.connectedDevices;
      connectedDevices.clear();
      for (BluetoothDevice d in devicesConnected) {
        connectedDevices.add(d);
      }
    } catch (identifier) {
      print('check connected device error');
      print(identifier);
    }
  }

  @override
  void onInit() {
    super.onInit();
    searchDevices();
  }
}
