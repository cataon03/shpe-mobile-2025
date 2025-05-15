import 'package:flutter/material.dart';
import 'package:shpeucfmobile/custom_button.dart';
import 'package:shpeucfmobile/homescreen.dart';
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset('lib/images/background.png', fit: BoxFit.cover),

          // CREATE ACCOUNT title with stroke + fill
          Positioned(
            top: 55,         // tweak as needed
            left: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // 1) Outline
                Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(
                    fontFamily: 'Adumu',
                    fontSize: 45,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..color = Colors.black,
                  ),
                ),
                // 2) Fill
                Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(
                    fontFamily: 'Adumu',
                    fontSize: 45,
                    color: Color(0xFFFFC13B),
                  ),
                ),
              ],

            ),
          ),
          // SignUp form 
          Positioned(
            bottom: 200,
            left: 20,
            right: 20,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  // all the input buttons implemented from login dart
                  InputField(text: 'First Name',),
                  SizedBox(height: 20),
                  InputField(text: 'Last Name'),
                  SizedBox(height: 20),
                  InputField(text: 'UCF Email'),
                  SizedBox(height: 20),
                  InputField(text: 'UCF ID'),
                  SizedBox(height: 20),
                  // more specific text boxes
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF1F3F7),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.password),
                    ),
                    obscureText: true,

                  ),
                  SizedBox(height: 20),

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
                      labelText: "Date",
                      suffixIcon: Icon(Icons.calendar_today)
                    ),
                  ),
                  SizedBox(height: 50),
                  // Submission button
                  CustomButton(text: 'SignUp', backgroundColor: Color(0xFFF2AC02) , textColor: Color(0xFFF1F3F7), onPressed: (){
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