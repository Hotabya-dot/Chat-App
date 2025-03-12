import 'package:flutter/material.dart';
import 'package:messenger/config/theme/app_theme.dart';
import 'package:messenger/presentation/screens/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home:const LoginScreen(),
    );
  }
}

