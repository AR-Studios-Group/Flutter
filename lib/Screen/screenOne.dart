import 'package:first_app/Controllers/users_controller.dart';
import 'package:first_app/Views/UserCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/instance_manager.dart';

class ScreenOne extends StatelessWidget {
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: GetX<UserController>(
            builder: ((controller) {
              return ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  return UserCard(
                    user: controller.users[index],
                    userController: userController,
                  );
                },
              );
            }),
          ))
        ],
      ),
    ));
  }
}
