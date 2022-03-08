import 'package:first_app/Models/users.dart';
import 'package:flutter/material.dart';

import '../Controllers/users_controller.dart';

class UserCard extends StatelessWidget {
  final User user;
  final UserController userController;
  const UserCard({Key? key, required this.user, required this.userController})
      : super(key: key);

  void _handleDeleteUser() {
    userController.deleteUser(user);
  }

  @override
  Widget build(BuildContext context) {
    var userId = user.id;
    return Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.lightBlueAccent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.username,
                    style: const TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    )),
                Text(user.email),
                Text(user.phone),
                Text('User ID $userId')
              ],
            ),
            GestureDetector(
              onTap: _handleDeleteUser,
              child: const Icon(Icons.delete),
            )
          ],
        ));
  }
}
