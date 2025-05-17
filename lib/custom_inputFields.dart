import 'package:flutter/material.dart';

//standard input field
class InputField extends StatelessWidget {
  const InputField({super.key, required this.controller, required this.text});
  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1F3F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        labelText: text,
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// the same as standard but has the icon and obscures text
class PasswordInputField extends StatelessWidget {
  const PasswordInputField({
    super.key,
    required this.text,
    required this.controller,
  });
  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1F3F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        labelText: text,
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
        suffixIcon: Icon(Icons.password),
      ),
      obscureText: true,
    );
  }
}
