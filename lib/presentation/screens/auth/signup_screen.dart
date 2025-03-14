import 'package:flutter/material.dart';
import 'package:messenger/core/common/custom_button.dart';
import 'package:messenger/core/common/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:messenger/presentation/screens/auth/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final bool _isPasswordVisible = false;

  final _nameFocus = FocusNode();
  final _usernameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    _nameFocus.dispose();
    _usernameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();

    super.dispose();
  }

  String? _validateName(String? value){
    if(value == null || value.isEmpty){
      return "Please enter your full name";
    }
  }
  String? _validateUsername(String? value){
    if(value == null || value.isEmpty){
      return "Please enter your username";
    }
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
  String? _validatePhone(String? value){
    if(value == null || value.isEmpty){
      return "Please enter your phone number";
    }
    final phoneRegex = RegExp(r'^\+?[\d\s-]{10,}$');
    if(!phoneRegex.hasMatch(value)){
      return 'Please enter a valid phone number (e.g., +91999999916)';

    }
    return null;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Account",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please fill in the details to continue',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: nameController, 
                  focusNode: _nameFocus,
                  hintText: "Full Name",
                  validator: _validateName,
                  prefixIcon: const Icon(Icons.person_outline),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: usernameController, 
                  focusNode: _usernameFocus,
                  hintText: "Username",
                  validator: _validateUsername,
                  prefixIcon: const Icon(Icons.alternate_email),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: emailController, 
                  focusNode: _emailFocus,
                  hintText: "Email",
                  validator: _validateEmail,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController, 
                  focusNode: _passwordFocus,
                  obscureText: _isPasswordVisible,
                  hintText: "Password",
                  validator: _validatePassword,
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: phoneController, 
                  focusNode: _phoneFocus,
                  keyboardtype: TextInputType.phone,
                  hintText: "Phone Number",
                  validator: _validatePhone,
                  prefixIcon: const Icon(Icons.phone_outlined), 
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState?.validate() ?? false) {
                      
                    }
                  },
                  text: "Create Account",
                ),
                const SizedBox(height: 20),  
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account?  ",
                      style: TextStyle(color: Colors.grey[600]),
                      children: [
                        TextSpan(
                           text: "Login",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.pop(context);
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
