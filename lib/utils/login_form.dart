import 'package:flutter/material.dart';
import 'package:quick_chop/utils/password_input.dart';
import 'package:quick_chop/utils/text_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Phone input
          TextInput(
            icon: const Icon(Icons.email_outlined),
            controller: emailController,
            hint: 'Email',
            keyboardType: TextInputType.emailAddress,
            isObscured: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),

          const SizedBox(height: 10),

          //email input
          PasswordInput(
            icon: const Icon(Icons.lock_outline),
            controller: passwordController,
            hint: 'Password',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
