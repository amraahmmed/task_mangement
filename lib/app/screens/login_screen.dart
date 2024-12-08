import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mangement/app/screens/tasks_screen.dart';
import 'package:task_mangement/login_provider.dart'; // Import the LoginProvider

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginUser() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Check if the fields are empty
    if (email.isEmpty || password.isEmpty) {
      _showDialog('Error', 'All fields are required.');
      return;
    }

    // Call the provider's login method
    bool isValidUser = Provider.of<LoginProvider>(context, listen: false)
        .loginUser(email, password);

    // If user is not valid, show an error dialog
    if (!isValidUser) {
      _showDialog('Error', 'Invalid email or password.');
      return;
    }

    // If valid, navigate to the tasks screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TasksScreen()),
    );
  }

  // Function to show dialog
  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    children: [
                      Text(
                        'LET’S SIGN YOU IN',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.deepOrange,
                          fontFamily: 'Teko',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Welcome back. You’ve been missed!',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 14,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Your email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Your password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: _loginUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 77, 12),
                      fixedSize: const Size(311, 48),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}