import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_chop/pages/register.dart';
import 'package:quick_chop/services/auth_service.dart';
import 'package:quick_chop/utils/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                if (_formKey.currentState!.validate()) {
                  // If the form is valid,login the user.
                  authService.login(
                      emailController.text.trim(), passwordController.text, () {
                    Navigator.pushNamed(context, '/home');
                  }, () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        content: Text('Something went wrong, try again'),
                      ),
                    );
                  });
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
                  child: loading
                      ? const CircularProgressIndicator(
                          backgroundColor: Colors.transparent,
                          color: Colors.black,
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
                      MaterialPageRoute(builder: (c) => const RegisterPage()),
                    );
                  },
                  child: loading
                      ? const CircularProgressIndicator()
                      : Text(
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
