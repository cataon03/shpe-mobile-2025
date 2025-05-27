import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shpeucfmobile/widgets/custom_button.dart';
import 'package:shpeucfmobile/screens/homescreen.dart';
import 'package:shpeucfmobile/widgets/custom_inputFields.dart';
import 'package:shpeucfmobile/services/firebase_auth_service.dart';
import 'package:shpeucfmobile/services/supabase_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ucfidController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset('lib/images/background.png', fit: BoxFit.cover)
          ),

          SafeArea(
            minimum: EdgeInsets.only(top: 50),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: bottomInset > 0 ? bottomInset : 180),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 0, left: 20, right: 20,),
                    child: Column(
                      children: [
                        SHPEHeaderText(text: 'CREATE ACCOUNT'),
                        SizedBox(height: 43),
                        InputField(text: 'First Name', controller: firstNameController),
                        SizedBox(height: 25),
                        InputField(text: 'Last Name', controller: lastNameController),
                        SizedBox(height: 25),
                        InputField(text: 'UCF Email', controller: emailController),
                        SizedBox(height: 25),
                        InputField(text: 'UCF ID', controller: ucfidController),
                        SizedBox(height: 25),
                        PasswordInputField(text: 'Password', controller: passwordController),
                        SizedBox(height: 25),

                        TextField(
                          controller: birthdayController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              String formatted = "${pickedDate.year.toString()}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                              birthdayController.text = formatted;
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF1F3F7),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                            labelText: "Birthday (YYYY-MM-DD)",
                            labelStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                            suffixIcon: Icon(Icons.calendar_today)
                          ),
                        ),
                      ],
                    )
                  ),
                ),

                Positioned(
                  bottom: 20, 
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      CustomButton(
                        text: 'Sign Up',
                        backgroundColor: Color(0xFFF2AC02),
                        textColor: Color(0xFFF1F3F7),
                        onPressed: () async {
                          final authService = FirebaseAuthService();
                          final supabaseService = SupabaseService();

                          try {
                            final user = await authService.signUp(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );

                            if (user != null) {
                              await user.sendEmailVerification();
                
                              await supabaseService.insertUser(
                                firebaseUid: user.uid,
                                email: user.email ?? '',
                                firstname: firstNameController.text.trim(),
                                lastname: lastNameController.text.trim(),
                                ucfid: int.parse(ucfidController.text.trim()),
                                birthday: birthdayController.text.trim(),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Verification email sent. Please log in after verifying.")),
                              );
                              Navigator.pushReplacementNamed(context, '/login');
                            }
                          } catch (e) {
                            print('Sign-up failed: $e');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Sign-up failed: ${e.toString()}')),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 10),
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
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/login');
                                  print('clicked log in!');
                                },
                            )
                          ]
                        )
                      )
                    ],
                  )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SHPEHeaderText extends StatelessWidget {
  final String text;
  const SHPEHeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Adumu',
            fontSize: 41,
            color: Color(0xFFF2AC02),
          ),
        ),
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
