import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_chop/pages/register.dart';
import 'package:quick_chop/pages/verify_otp_page.dart';
import 'package:quick_chop/services/auth_service.dart';
import 'package:quick_chop/utils/text_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          children: [
            Text(
              'Welcome Back to Quick Chop',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(height: 20),
            Text(
              'Enter your Phone number to Sign In',
              style: GoogleFonts.lato(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(height: 20),

            // Phone input
            TextInput(
              icon: const Icon(Icons.person_outline),
              controller: phoneController,
              hint: 'Phone number',
              keyboardType: TextInputType.phone,
              isObscured: false,
            ),
            const SizedBox(height: 5),
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
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  loading = true;
                });

                authService.registerWithPhoneSession(
                  "+234${phoneController.text.trim()}",
                  () {
                    setState(() {
                      loading = false;
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (c) => VerifyOTP(
                                currentPhone: phoneController.text,
                              )),
                    );
                  },
                  () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('An error occurred'),
                      ),
                    );
                  },
                );

                // setState should be inside the authService callback to ensure it is set
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.primary,
                ),
                width: double.infinity,
                child: Center(
                  child: loading
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Send OTP",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                ),
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account yet?",
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (c) => const RegisterPage()),
                    );
                  },
                  child: loading
                      ? const CircularProgressIndicator()
                      : Text(
                          'Register Now',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14,
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

var phoneController = TextEditingController();
