import 'package:flutter/material.dart';
import 'package:shpeucfmobile/custom_button.dart';

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

          //welcome image
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "WELCOME BACK",
                style: TextStyle(fontSize: 25, color: Colors.amber),
              ),
            ),
          ),

          //subheading
          //maybe change so the elements are in a column? for now we're good
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Don't have an account? Sign up",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          

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
                    //changed custom button to elevated bc of hardcoded font size
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

          //forgot password button
          // Positioned(
          //   bottom: 400,
          //   left: 30,
          //   right: 0,
          //   child: Center(
          //     child: CustomButton(
          //       text: 'Forgot password?',
          //       backgroundColor: Colors.transparent,
          //       textColor: Color(0xFFF1F3F7),

          //       onPressed: () {
          //         print('clicked forgot password!');
          //       },
          //     ),
          //   ),
          // ),

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
                  print('clicked login!');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//custom textformfield for repeated use
class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1F3F7),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
        labelText: text,
      ),
    );
  }
}
