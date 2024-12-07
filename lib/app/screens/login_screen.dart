import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_mangement/app/screens/tasks_screen.dart';
import 'package:task_mangement/app/widgets/my_container.dart';
import 'package:task_mangement/app/widgets/my_sized_box.dart';
import 'package:task_mangement/app/widgets/my_text_form.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  child: SvgPicture.asset(
                    'assets/icons/back.svg',
                    width: 24,
                  ),
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
              myTextForm(
                labelText: "Your email",
                obscureText: false,
                color: Colors.deepOrange,
              ),
              mySizedBox(height: 24),
              myTextForm(
                  labelText: "Your password",
                  obscureText: true,
                  color: Colors.deepOrange,
                  icon: true),
              mySizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  },
                    child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return   TasksScreen();
                    }));
                  },
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
              ),
              mySizedBox(height: 24),
              const Center(
                child: Text(
                  'Or login with',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 255, 77, 12),
                  ),
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
    );
  }
}





    // child: ElevatedButton(
    //               onPressed: () {
    //                 Navigator.push(context, MaterialPageRoute(builder: (context) {
    //                   return  TasksScreen();
    //                 }));
    //               },
    //               style: ElevatedButton.styleFrom(
    //                 backgroundColor: const Color.fromARGB(255, 255, 77, 12),
    //                 fixedSize: const Size(311, 48),
    //               ),
    //               child: const Text(
    //                 'Login',
    //                 style: TextStyle(
    //                   color: Color.fromARGB(255, 255, 255, 255),
    //                   fontWeight: FontWeight.w600,
    //                 ),
    //               ),
    //             ),