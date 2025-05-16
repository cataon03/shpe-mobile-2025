import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shpeucfmobile/homescreen.dart';
import 'package:shpeucfmobile/login.dart';
import 'package:shpeucfmobile/SignUp.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Entry point of the Flutter app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  //init Supabase connection
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  runApp(const MyApp());
}




// Define a stateless widget called MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Hides the debug banner in the top-right corner
      home: const HomeScreen(),
      routes: {
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
      }
    );
  }
}
