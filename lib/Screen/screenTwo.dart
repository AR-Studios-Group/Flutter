import 'package:first_app/Controllers/users_controller.dart';
import 'package:first_app/Models/users.dart';
import 'package:first_app/Screen/ScreenFive.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

import '../Controllers/users_controller.dart';

class ScreenTwo extends StatelessWidget {
  final UserController userController = Get.find();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();

  void dispose() {
    userController.dispose();
  }

  void handleAddUser() {
    var username = usernameController.text;
    var email = emailController.text;
    var phone = phoneController.text;
    var website = websiteController.text;

    var lastUserId;

    try {
      lastUserId = userController.users.last.id;
    } catch (identifier) {
      lastUserId = 0;
    }

    userController.addUser(User(
        id: lastUserId + 1,
        username: username,
        email: email,
        phone: phone,
        website: website));

    usernameController.text = '';
    emailController.text = '';
    phoneController.text = '';
    websiteController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
        backgroundColor: Colors.lime,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your email id',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your phone',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: websiteController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your website',
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lime)),
            onPressed: handleAddUser,
            child: const Text(
              'Add user',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lime)),
              onPressed: () {
                Get.to(const ScreenFive(), transition: Transition.downToUp);
              },
              child: const Text('Navigation to new screen'))
        ],
      ),
    );
  }
}
