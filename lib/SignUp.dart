import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shpeucfmobile/custom_button.dart';
import 'package:shpeucfmobile/homescreen.dart';
import 'package:shpeucfmobile/custom_inputFields.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

TextEditingController _dateController = TextEditingController();
final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _ucfIdController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

// Thoughts
// Can maybe breakdown the login in process to two pages?

// Load database
final supabase = Supabase.instance.client;

// demo
Future<void> fetchData() async {
  final data = await supabase.from("users").select();
  print(data);
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset('lib/images/background.png', fit: BoxFit.cover),
          ),

          SafeArea(
            // SafeArea to avoid different phone UI
            minimum: EdgeInsets.only(top: 50),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: bottomInset > 0 ? bottomInset : 180,
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 0, left: 20, right: 20),
                    child: Column(
                      children: [
                        SHPEHeaderText(text: 'CREATE ACCOUNT'),
                        SizedBox(height: 43), //space before inputs
                        InputField(
                          text: 'First Name',
                          controller: _firstNameController,
                        ),
                        SizedBox(height: 25),
                        InputField(
                          text: 'Last Name',
                          controller: _lastNameController,
                        ),
                        SizedBox(height: 25),
                        InputField(
                          text: 'UCF Email',
                          controller: _emailController,
                        ),
                        SizedBox(height: 25),
                        InputField(
                          text: 'UCF ID',
                          controller: _ucfIdController,
                        ),
                        SizedBox(height: 25),
                        PasswordInputField(
                          text: 'Password',
                          controller: _passwordController,
                        ),
                        SizedBox(height: 25),

                        // date picker
                        TextField(
                          controller: _dateController,
                          readOnly: true, //prevents keyboard from showing
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              String formatted = pickedDate.toIso8601String();
                              _dateController.text = formatted;
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF1F3F7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            labelText: "Birthday (MM/DD)",
                            labelStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      // sign up button
                      CustomButton(
                        text: 'Sign Up',
                        backgroundColor: Color(0xFFF2AC02),
                        textColor: Color(0xFFF1F3F7),
                        onPressed: () async {
                          final firstName = _firstNameController.text.trim();
                          final lastName = _lastNameController.text.trim();
                          final email = _emailController.text.trim();
                          final ucfId = _ucfIdController.text.trim();
                          final password = _passwordController.text;
                          final birthday = _dateController.text.trim();

                          if ([
                            firstName,
                            lastName,
                            email,
                            ucfId,
                            password,
                            birthday,
                          ].any((e) => e.isEmpty)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Please fill out all fields"),
                              ),
                            );
                            return;
                          }

                          try {
                            await supabase.from('users').insert({
                              'firstname': firstName,
                              'lastname': lastName,
                              'email': email,
                              'ucfid': ucfId,
                              'password':
                                  password, // Note: Don't store plaintext passwords
                              'birthday': birthday,
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomeScreen(),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Error: ${e.toString()}")),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 10),

                      //log in? text
                      RichText(
                        text: TextSpan(
                          text: 'Already Registered? ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFFF1F3F7),
                          ),
                          children: [
                            TextSpan(
                              text: 'Log in here.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xFFF1F3F7),
                                decoration: TextDecoration.underline,
                              ),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, '/login');
                                      print('clicked log in!');
                                    },
                            ),
                          ],
                        ),
                      ),
                    ],
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
