import 'dart:convert';
import 'package:first_app/Models/users.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var users = <User>[].obs;

  void deleteUser(User u) {
    users.remove(u);
  }

  void addUser(User u) {
    users.add(u);
  }

  void fetchUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (var i = 0; i < data.length; i++) {
        var u = data[i];
        users.insert(
            users.length,
            User(
                id: u['id'],
                username: u['username'],
                email: u['email'],
                phone: u['phone'],
                website: u['website']));
      }
    } else {
      print('Error in fetching');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }
}
