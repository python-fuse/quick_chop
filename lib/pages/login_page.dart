import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_chop/pages/register.dart';
import 'package:quick_chop/pages/verify_otp_page.dart';
import 'package:quick_chop/utils/text_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

var phoneController = TextEditingController();
var passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Welcome Back to Quick Chop',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            Text(
              'Enter your Phone number to Sign In',
              style: GoogleFonts.lato(
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

            // remember me

            Row(
              children: [
                Checkbox(value: true, onChanged: (val) {}),
                Text(
                  'Remember Me',
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.inversePrimary),
                )
              ],
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return VerifyOTP(
                    currentPhone: phoneController.text,
                  );
                }));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.primary),
                width: double.infinity,
                child: const Center(
                  child: Text(
                    "Send OTP",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account yet?",
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => const RegisterPage()));
                  },
                  child: Text(
                    'Register Now',
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
