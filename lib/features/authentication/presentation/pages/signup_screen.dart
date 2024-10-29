import 'package:flutter/material.dart';
import 'package:hookee/core/constants/animated_bg.dart';
import 'package:hookee/core/constants/string.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50.withOpacity(0.9),
      body: Stack(
        children: [
          AnimatedBackground(controller: _controller),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hookie,
                  style: TextStyle(
                    fontFamily: 'Dancing Script',
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..strokeWidth = 3
                      ..color = Colors.pink.shade200.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  signup_text,
                  style: TextStyle(
                    fontFamily: 'Dancing Script',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..strokeWidth = 3
                      ..color = Colors.black,
                  ),
                ),
                Text(
                  signup_text,
                  style: TextStyle(
                    fontFamily: 'Dancing Script',
                    fontSize: 18,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..strokeWidth = 3
                      ..color = Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        email_option,
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pinkAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        phone_option,
                        style:
                            TextStyle(color: Colors.pinkAccent, fontSize: 17),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey.shade200,
                                Colors.grey.shade400
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          'Or Signup With',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey.shade400,
                                Colors.grey.shade200
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 56.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white24,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.asset('assets/google.webp'),
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                'Google',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Container(
                          height: 56.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white30,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.facebook_sharp,
                                  size: 30, color: Colors.blue.shade400),
                              const SizedBox(width: 10.0),
                              Text(
                                'Facebook',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Footer with Terms and Conditions
          Positioned(
            bottom: 26.0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'I Accept All The ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to terms and conditions page
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Terms and Conditions',
                            style: TextStyle(
                              color: Colors.pink,
                            )),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            '&',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to privacy policy page
                          },
                          child: const Text('Privacy Policy',
                              style: TextStyle(
                                color: Colors.pink,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
