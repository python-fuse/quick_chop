import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final bool isObscured;
  final TextEditingController controller;
  final Icon icon;
  final TextInputType keyboardType;

  const TextInput(
      {super.key,
      required this.icon,
      required this.controller,
      required this.hint,
      required this.keyboardType,
      required this.isObscured});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      controller: controller,
      obscureText: isObscured,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle:
            TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        prefixIcon: icon,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
