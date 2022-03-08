import 'package:first_app/Screen/screenFour.dart';
import 'package:first_app/Screen/screenOne.dart';
import 'package:first_app/Screen/screenThree.dart';
import 'package:first_app/Screen/screenTwo.dart';
import 'package:flutter/material.dart';

class BottomTabNaviagation extends StatefulWidget {
  const BottomTabNaviagation({Key? key}) : super(key: key);

  @override
  _BottomTabNavigationState createState() => _BottomTabNavigationState();
}

class _BottomTabNavigationState extends State<BottomTabNaviagation> {
  int _currentIndex = 0;

  void _handleOnTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Color _handleBackgroundColor() {
    switch (_currentIndex) {
      case 0:
        return Colors.lightBlueAccent;
      case 1:
        return Colors.limeAccent;
      case 2:
        return Colors.pinkAccent;
      default:
        return Colors.lightGreenAccent;
    }
  }

  Widget _handleCurrentWidget() {
    switch (_currentIndex) {
      case 0:
        return ScreenOne();
      case 1:
        return ScreenTwo();
      case 2:
        return ScreenThree();
      case 3:
        return ScreenFour();
      default:
        return const Text('Invalid Index');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _handleCurrentWidget(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: 'Users'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add), label: 'Add Users'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bluetooth), label: 'flutter blue'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bluetooth), label: 'reactive ble')
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _handleOnTap,
        backgroundColor: _handleBackgroundColor(),
        selectedItemColor: Colors.black,
      ),
    );
  }
}
