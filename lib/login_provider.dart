import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  // List to hold registered users (simulating a database)
  final List<Map<String, String>> _users = [
    {'email': 'amr@gmail.com', 'password': '123456', 'name': 'Amr'},
    {'email': 'alkourdi@gmail.com', 'password': '123456', 'name': 'Alkourdi'},
    {'email': 'mohamed@gmail.com', 'password': '123456', 'name': 'Mohamed'},
  ];

  // Getter to access users
  List<Map<String, String>> get users => _users;

  // Method to add a new user
  void addUser(String email, String password, String name) {
    _users.add({'email': email, 'password': password, 'name': name});
    notifyListeners(); // Notify listeners that the state has changed
  }

  // Method to login a user
  bool loginUser(String email, String password) {
    final user = _users.firstWhere(
      (user) => user['email'] == email && user['password'] == password,
      orElse: () => {},
    );
    return user.isNotEmpty;
  }
}
