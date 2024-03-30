import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_chop/pages/verify_otp_page.dart';
import 'package:quick_chop/services/auth_service.dart';
import 'package:quick_chop/utils/text_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var levelController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        title: Text('Sign Up',
            style: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        scrolledUnderElevation: 1,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            //mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome to Quick Chop',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              Text(
                'Enter your details to create an account',
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),

              const SizedBox(height: 5),

              // Phone input
              Form(
                key: _formKey,
                child: TextInput(
                  icon: const Icon(Icons.phone_outlined),
                  controller: phoneController,
                  hint: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  isObscured: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a password';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, send otp.
                    authService.registerWithPhoneSession(
                        phoneController.text.trim(), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VerifyOTP(currentPhone: phoneController.text),
                        ),
                      );
                    }, () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          content: Text('Something went wrong, try again')));
                    });
                  }
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
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
