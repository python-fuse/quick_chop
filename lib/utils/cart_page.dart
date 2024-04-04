import 'package:flutter/material.dart';
import 'package:quick_chop/utils/password_input.dart';
import 'package:quick_chop/utils/text_input.dart';

class DetailsForm extends StatelessWidget {
  const DetailsForm({
    super.key,
    required GlobalKey<FormState> detailsFormKey,
    required this.levelController,
    required this.deptController,
    required GlobalKey<FormState> passwordFormKey,
    required this.oldPasswordController,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : _detailsFormKey = detailsFormKey, _passwordFormKey = passwordFormKey;

  final GlobalKey<FormState> _detailsFormKey;
  final TextEditingController levelController;
  final TextEditingController deptController;
  final GlobalKey<FormState> _passwordFormKey;
  final TextEditingController oldPasswordController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Form(
            key: _detailsFormKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextInput(
                  icon: const Icon(Icons.school_outlined),
                  controller: levelController,
                  hint: 'Your current level',
                  keyboardType: TextInputType.number,
                  isObscured: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your current year study';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextInput(
                  icon: const Icon(Icons.class_outlined),
                  controller: deptController,
                  hint: 'Department',
                  keyboardType: TextInputType.text,
                  isObscured: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your department';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Form(
              key: _passwordFormKey,
              child: Column(
                children: [
                  PasswordInput(
                    icon: const Icon(Icons.lock_outline),
                    controller: oldPasswordController,
                    hint: 'Old Password',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.length < 8) {
                        return 'Enter old password';
                      } else if (value == null || value.isEmpty) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  PasswordInput(
                    icon: const Icon(Icons.lock_outline),
                    controller: passwordController,
                    hint: 'New Password',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.length < 8) {
                        return 'Password must at least 8 characters';
                      } else if (value == null || value.isEmpty) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  PasswordInput(
                    icon: const Icon(Icons.lock_outline),
                    controller: confirmPasswordController,
                    hint: 'Confirm new password',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.length < 8) {
                        return 'Password must at least 8 characters';
                      } else if (value != passwordController.text) {
                        return 'Passwords do not match';
                      } else if (value == null || value.isEmpty) {
                        return 'Confirm your password';
                      }
                      return null;
                    },
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
