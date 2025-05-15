import 'package:flutter/material.dart';
import 'package:shpeucfmobile/custom_button.dart';
import 'package:shpeucfmobile/homescreen.dart';
import 'package:shpeucfmobile/custom_inputFields.dart';
TextEditingController _dateController = TextEditingController();

// TODO
// validate all fields before allowing submission
// might have to change all textfield to formtexfield

// Thoughts
// Can maybe breakdown the login in process to two pages?


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset('lib/images/background.png', fit: BoxFit.cover),

          // CREATE ACCOUNT title with stroke + fill
          Positioned(
            top: 60,         // tweak as needed
            left: 17,
            right: 17,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                    SHPEHeaderText(text: 'CREATE ACCOUNT'),
                    SizedBox(height: 3),
                    Text(
                      'Already registered? Log in here.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFFF1F3F7),
                      )
                    ),
                  ],
                ),
              ],

            ),
          ),
          // SignUp form 
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // all the input buttons implemented from login dart
                  InputField(text: 'First Name'),
                  SizedBox(height: 25),
                  InputField(text: 'Last Name'),
                  SizedBox(height: 25),
                  InputField(text: 'UCF Email'),
                  SizedBox(height: 25),
                  InputField(text: 'UCF ID'),
                  SizedBox(height: 25),

                  // this line below was cam testing smth out
                  //PasswordInputField(text: 'Password'),

                  // more specific text boxes
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF1F3F7),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: Icon(Icons.password),
                    ),
                    obscureText: true,

                  ),
                  SizedBox(height: 25),

                  //date picker
                  TextField(
                    controller: _dateController, // opens up the date selector respective to each os
                    readOnly: true, //prevents keyboard from showing
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        String formatted = "${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}";
                        _dateController.text = formatted;
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF1F3F7),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      labelText: "Birthday (MM/DD)",
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: Icon(Icons.calendar_today)
                    ),
                  ),
                  SizedBox(height: 50),
                  // Submission button
                  CustomButton(
                    text: 'Sign Up',
                    backgroundColor: Color(0xFFF2AC02),
                    textColor: Color(0xFFF1F3F7),
                    onPressed: (){
                      // Either navigate back to homescreen or actual app
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomeScreen())
                    );
                  }
                   )
                  
                ],
              )
            ),


          )
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
            fontSize: 41,
            color: Color(0xFFF2AC02),
          ),
        ),
        // 2) Outline
        // TODO: figure out how to offset the outline like the mockup img
        Text(
          text,
           style: TextStyle(
            fontFamily: 'Adumu',
            fontSize: 41,
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