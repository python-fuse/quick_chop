import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_chop/pages/home_page.dart';
import 'package:quick_chop/pages/register.dart';
import 'package:quick_chop/services/auth_service.dart';
import 'package:quick_chop/utils/login_form.dart';
import 'package:quick_chop/utils/transition_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isloading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    String handleError(error) {
      switch (error) {
        case 'user_password_mismatch':
          return 'Incorrect Password';
        case 'user_blocked':
          return 'Your account has been blocked! Contact administrator.';
        case 'user_invalid_credentials':
          return 'Email or password not correct';
        case 'user_not_found':
          return "User with this email not found, Create an account";
        default:
          return 'Something went wrong, Try again';
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              'Enter your Email to Sign In',
              style: GoogleFonts.lato(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(height: 20),

            // form for login
            LoginForm(
                formKey: _formKey,
                emailController: emailController,
                passwordController: passwordController),

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
                  isloading = true;
                });
                if (_formKey.currentState!.validate()) {
                  // If the form is valid,login the user.
                  authService.login(
                    emailController.text.trim(),
                    passwordController.text,
                    () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (c) => const HomePage()));
                    },
                    (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            handleError(e.type),
                          ),
                        ),
                      );
                    },
                  ).then(
                    (value) => setState(
                      () {
                        isloading = false;
                      },
                    ),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.primary,
                ),
                width: double.infinity,
                child: Center(
                  child: isloading == true
                      ? const CircularProgressIndicator(
                          backgroundColor: Colors.transparent,
                          color: Colors.white,
                          strokeWidth: 2,
                        )
                      : const Text(
                          "Log in",
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
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      CustomRouter(page: const RegisterPage()),
                    );
                  },
                  child: Text(
                    'Register Now',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18,
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
