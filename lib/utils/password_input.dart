import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Icon icon;
  final TextInputType keyboardType;
  final FormFieldValidator validator;

  const PasswordInput(
      {super.key,
      required this.icon,
      required this.controller,
      required this.hint,
      required this.keyboardType,
      required this.validator});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      autocorrect: false,
      controller: widget.controller,
      obscureText: true,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle:
            TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        prefixIcon: widget.icon,
        suffixIcon: IconButton(
          icon: Icon(isObscured ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
        ),
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
