import 'package:flutter/material.dart';


//standard input field
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
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
      )
    );
  }
}


// the below was cam testing more things out, will clean up later

// class IconPrefixInputField extends StatelessWidget {
//   const IconPrefixInputField({
//     super.key,
//     required this.text,
//     required this.prefixIcon,
//   });

//   final String text;
//   final Icon prefixIcon;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Color(0xFFF1F3F7),
//         border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
//         labelText: text,
//         prefixIcon: prefixIcon,
//       ),
//     );
//   }
// }

// class PasswordInputField extends StatelessWidget {
//   const PasswordInputField({
//     super.key,
//     required this.text,
//   });

//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Color(0xFFF1F3F7),
//         border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
//         labelText: text,
//         suffixIcon: Icon(Icons.password),
//       ),
//       obscureText: true,
//     );
//   }
// }