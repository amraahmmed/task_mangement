import 'package:flutter/material.dart';
import 'package:task_mangement/app/screens/second_welcome_screen.dart';
import '../widgets/my_sized_box.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Image.asset(
                    'assets/image/task.png',
                    width: 160,
                    height: 160,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
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
                        'Never miss a goal - Make your life easier with our app',
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
                          return const SecondWelcomeScreen();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        fixedSize: const Size(311, 48),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}