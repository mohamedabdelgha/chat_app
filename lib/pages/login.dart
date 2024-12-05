import 'package:chat_app/pages/home.dart';
import 'package:chat_app/pages/register.dart';
import 'package:chat_app/widgets/themes.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller1;
  late Animation<double> _imageAnimation;
  late Animation<double> _formAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _controller1 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Define the animations for the image and the form
    _imageAnimation = Tween<double>(begin: -200, end: 80).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _formAnimation = Tween<double>(begin: -400, end: 150).animate(
      CurvedAnimation(parent: _controller1, curve: Curves.easeOut),
    );

    // Start the animation
    _controller.forward();
    _controller1.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xffededf7),
      body: Stack(
        children: [
          // Image animation
          AnimatedBuilder(
            animation: _imageAnimation,
            builder: (context, child) {
              return Positioned(
                top: _imageAnimation.value,
                left: 120,
                right: 120,
                child: Image.asset(
                  logo_image,
                  // width: 190,
                ),
              );
            },
          ),
          // Form animation
          AnimatedBuilder(
            animation: _formAnimation,
            builder: (context, child) {
              return Positioned(
                bottom: _formAnimation.value,
                left: 10,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const InputFields(
                        icon: Icon(
                          Icons.email_rounded,
                          color: Color(0xffc1c2e0),
                        ),
                        labeltext: 'Email',
                      ),
                      const InputFields(
                        icon: Icon(
                          Icons.key,
                          color: Color(0xffc1c2e0),
                        ),
                        labeltext: 'Password',
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the SecondPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Container(
                          width: 200,
                          alignment: Alignment.center,
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff7129c9),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "don't have an account! ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffc1c2e0),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigate to the SecondPage
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()),
                                );
                              },
                              child: const Text(
                                'Register NOW',
                                style: TextStyle(
                                    color: Color(0xff7129c9),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider_tool(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.g_mobiledata,
                              size: 60,
                              color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.facebook_rounded,
                              size: 40,
                              color: Colors.lightBlue,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
