import 'package:flutter/material.dart';
import 'package:modelhandling/screen/chat_screen.dart';
import 'package:modelhandling/screen/homepage.dart';
import 'package:modelhandling/screen/student_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://fxqjxcwilcofgkbpcfib.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4cWp4Y3dpbGNvZmdrYnBjZmliIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzA4ODQyMDksImV4cCI6MjA4NjQ2MDIwOX0.QNqsQ3yO88FGaQkW8Si-yvOglwcmaMmYl5A4CwH1O4k",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 64, 150, 230),
        ),
      ),
      home: const ChatPage(username: 'User'),
    );
  }
}
