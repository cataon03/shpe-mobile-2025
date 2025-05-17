import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shpeucfmobile/custom_button.dart';
import 'package:shpeucfmobile/custom_inputFields.dart';
import 'package:shpeucfmobile/homescreen.dart';

final TextEditingController _ucfEmailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          //Background image
          Image.asset('lib/images/background.png', fit: BoxFit.cover),

          SafeArea(
            //accounts for phone UIs
            minimum: EdgeInsets.only(top: 55),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: Column(
                      children: [
                        //header
                        SHPEHeaderText(text: 'WELCOME BACK'),
                        SizedBox(height: 210), //space before inputs
                        //email, password
                        InputField(
                          text: 'UCF Email',
                          controller: _ucfEmailController,
                        ),
                        SizedBox(height: 15),
                        PasswordInputField(
                          text: 'Password',
                          controller: _passwordController,
                        ),
                        SizedBox(height: 5),

                        //forgot password link
                        //TODO: route this to actual target screen once it's up
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: RichText(
                              text: TextSpan(
                                text: 'Forgot Password?',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFF1F3F7),
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(context, '/');
                                        print('clicked forgot password!');
                                      },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //login button and redirect text
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: [
                        //login button
                        CustomButton(
                          text: 'Login ',
                          backgroundColor: Color(0xFFF2AC02),
                          textColor: Color(0xFFF1F3F7),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        //redirect text to login page
                        RichText(
                          text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFF1F3F7),
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFFF1F3F7),
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(context, '/signup');
                                        print('clicked sign up!');
                                      },
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
          ),
        ],
      ),
    );
  }
}

//header font
class SHPEHeaderText extends StatelessWidget {
  final String text;

  const SHPEHeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1) Fill
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Adumu',
            fontSize: 45,
            color: Color(0xFFF2AC02),
          ),
        ),
        // 2) Outline
        // TODO: figure out how to offset the outline like the mockup img
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Adumu',
            fontSize: 45,
            foreground:
                Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.black,
          ),
        ),
      ],
    );
  }
}
