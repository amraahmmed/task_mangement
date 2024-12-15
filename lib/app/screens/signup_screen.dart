import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mangement/app/widgets/my_container.dart';
import 'package:task_mangement/app/widgets/my_sized_box.dart';
import 'package:task_mangement/login_provider.dart'; // Import the LoginProvider
import 'package:task_mangement/app/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void handleSignup() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = nameController.text.trim();

    // Validate the input fields
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      _showDialog('Error', 'All fields are required.');
      return;
    }

    // Add the new user via the provider
    Provider.of<LoginProvider>(context, listen: false)
        .addUser(email, password, name);

    // Show success message
    _showDialog('Success', 'Account created successfully.');

    // Clear the input fields
    emailController.clear();
    passwordController.clear();
    nameController.clear();

    // Navigate to the WelcomeScreen after a successful signup
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const LoginScreen()), // Redirect to WelcomeScreen
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
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.deepOrange,
                          fontFamily: 'Teko',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Your Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Your Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Your Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: handleSignup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 77, 12),
                      fixedSize: const Size(311, 48),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30), // Space between the button and text
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Teko',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 77, 12),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                mySizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myContainer(
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/image/button social.png',
                          width: 200,
                        ),
                      ),
                    ),
                    mySizedBox(width: 16),
                    myContainer(
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/image/button social-1.png',
                          width: 200,
                        ),
                      ),
                    ),
                    mySizedBox(width: 16),
                    myContainer(
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/image/button social-2.png',
                          width: 200,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}