import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final List<Map<String, String>> _users = [
    {'email': 'amr@gmail.com', 'password': '123456', 'name': 'Amr'},
    {'email': 'alkourdi@gmail.com', 'password': '123456', 'name': 'Alkourdi'},
    {'email': 'mohamed@gmail.com', 'password': '123456', 'name': 'Mohamed'},
  ];

  // Getter
  List<Map<String, String>> get users => _users;

  // add a new user
  void addUser(String email, String password, String name) {
    _users.add({'email': email, 'password': password, 'name': name});
    notifyListeners(); // Notify changed
  }

  // login a user
  bool loginUser(String email, String password) {
    final user = _users.firstWhere(
      (user) => user['email'] == email && user['password'] == password,
      orElse: () => {},
    );
    return user.isNotEmpty;
  }
}
