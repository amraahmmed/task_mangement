import 'package:flutter/material.dart';
import 'package:task_mangement/app/screens/login_screen.dart';
import 'package:task_mangement/app/screens/signup_screen.dart';
import '../widgets/my_sized_box.dart';

class SecondWelcomeScreen extends StatelessWidget {
  const SecondWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 44),
              Image.asset(
                'assets/image/project-management.png',
                width: 375,
                height: 416,
                fit: BoxFit.contain,
              ),
              mySizedBox(height: 40),
              const Text(
                'TASKIFY',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.deepOrange,
                  fontFamily: 'Teko',
                  fontWeight: FontWeight.w600,
                ),
              ),
              mySizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'We’d like to check that your preferences and details are accurate.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              mySizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  fixedSize: const Size(311, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              mySizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignupScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.deepOrange),
                  fixedSize: const Size(311, 48),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'Sign up for Taskify',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              mySizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}