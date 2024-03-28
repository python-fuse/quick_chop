import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_chop/utils/text_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

var phoneController = TextEditingController();
var passwordController = TextEditingController();
var confirmPasswordController = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Sign Up',
            style: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Welcome to Quick Chop',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontSize: 57,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            Text(
              'Enter your Phone number and create a strong password',
              style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),

            // Phone input
            TextInput(
              icon: const Icon(Icons.person_outline),
              controller: phoneController,
              hint: 'Phone number',
              keyboardType: TextInputType.phone,
              isObscured: false,
            ),

            // pass input
            TextInput(
              icon: const Icon(Icons.lock_outline),
              controller: passwordController,
              hint: 'Password',
              keyboardType: TextInputType.text,
              isObscured: true,
            ),

            // confirm password
            TextInput(
              icon: const Icon(Icons.lock_outline),
              controller: confirmPasswordController,
              hint: 'Confirm Password',
              keyboardType: TextInputType.text,
              isObscured: true,
            ),

            // remember me + forgotpass

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     // Row(
            //     //   children: [
            //     //     Checkbox(value: true, onChanged: (val) {}),
            //     //     const Text(
            //     //       'Remember Me',
            //     //       style: TextStyle(fontSize: 12),
            //     //     )
            //     //   ],
            //     // ),
            //     TextButton(
            //       onPressed: () {},
            //       child: Text(
            //         'Forgot Password',
            //         style: TextStyle(
            //             color: Theme.of(context).primaryColor, fontSize: 12),
            //       ),
            //     )
            //   ],
            // ),

            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.primary),
              width: double.infinity,
              child: const Center(
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
