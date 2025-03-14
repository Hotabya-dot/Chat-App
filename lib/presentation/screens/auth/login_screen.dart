import 'package:flutter/material.dart';
import 'package:messenger/core/common/custom_button.dart';
import 'package:messenger/core/common/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:messenger/presentation/screens/auth/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }
  String? _validateEmail(String? value){
    if(value == null || value.isEmpty){
      return "Please enter your Email Address";
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2, 4}$');
    if(!emailRegex.hasMatch(value)){
      return 'Please enter valid email address (e.g., example@gmail.com)';
    }
    return null;
  }
  String? _validatePassword(String? value){
    if(value == null || value.isEmpty){
      return "Please enter your password";
    }
    if(value.length < 6){
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'Welcome back',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Sign in to continue',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: emailController,
                  focusNode: _emailFocus,
                  validator: _validateEmail,
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                  focusNode: _passwordFocus,
                  validator: _validatePassword,
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  obscureText: true,
                  suffixIcon: Icon(Icons.visibility),
                ),
                const SizedBox(height: 30),
                CustomButton(onPressed: () {
                  FocusScope.of(context).unfocus();
                    if (_formKey.currentState?.validate() ?? false) {
                      
                    }
                }, text: 'Login'),
                const SizedBox(height: 20),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account?  ",
                      style: TextStyle(color: Colors.grey[600]),
                      children: [
                        TextSpan(
                           text: "Signup",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignupScreen())
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
