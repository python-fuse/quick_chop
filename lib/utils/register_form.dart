import 'package:flutter/material.dart';
import 'package:quick_chop/utils/password_input.dart';
import 'package:quick_chop/utils/text_input.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.passwordController,
    required this.phoneController,
    required this.emailController,
    required this.levelController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController levelController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextInput(
            icon: const Icon(Icons.lock_outline),
            controller: passwordController,
            hint: 'Full Name',
            keyboardType: TextInputType.text,
            isObscured: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextInput(
            icon: const Icon(Icons.person_outline),
            controller: phoneController,
            hint: 'Phone number',
            keyboardType: TextInputType.phone,
            isObscured: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextInput(
            icon: const Icon(Icons.mail_outline),
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
          TextInput(
            icon: const Icon(Icons.book_rounded),
            controller: levelController,
            hint: 'Enter your current level',
            keyboardType: TextInputType.number,
            isObscured: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your level';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          PasswordInput(
            icon: const Icon(Icons.lock_outline),
            controller: passwordController,
            hint: 'Password',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter a password';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          PasswordInput(
            icon: const Icon(Icons.lock_outline),
            controller: passwordController,
            hint: 'Confirm password',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter a password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
