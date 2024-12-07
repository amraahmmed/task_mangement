import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_mangement/app/widgets/my_container.dart';
import 'package:task_mangement/app/widgets/my_sized_box.dart';
import 'package:task_mangement/app/widgets/my_text_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: SafeArea(
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.deepOrange,
                          fontFamily: 'Teko',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: 'Teko',
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              
                              text: 'Sign in',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 77, 12),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Teko',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                myTextForm(
                  labelText: "Your Email",
                  obscureText: false,
                  color: Colors.deepOrange,
                ),
                mySizedBox(height: 24),
                myTextForm(
                  labelText: "Your Password",
                  obscureText: true,
                  color: Colors.deepOrange,
                  icon: true,
                ),
                mySizedBox(height: 24),
                myTextForm(labelText: "Your Name", color: Colors.deepOrange),
                mySizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
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
                mySizedBox(height: 24),
                const Center(
                  child: Text(
                    'Or sign up with',
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
      ),
    );
  }
}
