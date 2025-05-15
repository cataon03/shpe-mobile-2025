import 'package:flutter/material.dart';
import 'package:shpeucfmobile/custom_button.dart';
import 'package:shpeucfmobile/custom_inputFields.dart';
import 'package:shpeucfmobile/homescreen.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  //TODO
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        //Background image
        children: [
          Image.asset('lib/images/background.png', fit: BoxFit.cover),
          Positioned(
            top: 55,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  SHPEHeaderText(text: 'WELCOME BACK'),
                  SizedBox(height: 3),
                  Text(
                    'Don\'t have an account? Sign up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFFF1F3F7),
                    ),
                  )
                ]
              )
            ),
          ),

          //welcome image
          // Positioned(
          //   top: 40,
          //   left: 0,
          //   right: 0,
          //   child: Center(
          //     child: Text(
          //       "WELCOME BACK",
          //       style: TextStyle(
          //         fontFamily: 'Adumu',
          //         fontSize: 45,
          //         foreground: Paint()
          //           ..style = PaintingStyle.stroke
          //           ..strokeWidth = 4
          //           ..color = Colors.black,
          //         ),
          //     ),
          //   ),
          // ),

          //subheading
          //maybe change so the elements are in a column? for now we're good
          // Positioned(
          //   top: 70,
          //   left: 0,
          //   right: 0,
          //   child: Center(
          //     child: Text(
          //       "Don't have an account? Sign up",
          //       style: TextStyle(fontSize: 16, color: Colors.white),
          //     ),
          //   ),
          // ),
          

          //email and pass textbox
          Positioned(
            top: 300,
            left: 20,
            right: 20,
            child: Center(
              child: Column(
                children: [
                  InputField(text: 'UCF Email'),
                  SizedBox(height: 15),
                  InputField(text: 'Password'),
                  Align(
                    alignment: Alignment.centerRight,

                    //forgot password button
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: Text('Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFFF1F3F7),
                        )
                      ),
                      onPressed: (){
                        print('clicked forgot password!');
                      },
                    ),
                  )
                ],
              ),
            ),
          ),

          //login button
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: CustomButton(
                text: 'Login ',
                backgroundColor: Color(0xFFF2AC02),
                textColor: Color(0xFFF1F3F7),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen())
                  );
                },
              ),
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
  
  const SHPEHeaderText({
    super.key,
    required this.text,
    });

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
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = Colors.black,
            ),
        ),
      ]
    );
  }
}