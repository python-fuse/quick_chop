import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_chop/utils/text_input.dart';

class FinishSetup extends StatefulWidget {
  const FinishSetup({super.key});

  @override
  State<FinishSetup> createState() => _FinishSetupState();
}

class _FinishSetupState extends State<FinishSetup> {
  final _formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var levelController = TextEditingController();
  var deptController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                "Let's finish setting up your account",
                textAlign: TextAlign.start,
                style: GoogleFonts.lato(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              Text(
                'Fill in your information',
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const Text(
                "Please don't exit the app",
                style: TextStyle(fontSize: 14, color: Colors.red),
              ),

              const SizedBox(height: 5),

              // Phone input
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextInput(
                      icon: const Icon(Icons.email_outlined),
                      controller: emailController,
                      hint: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      isObscured: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your email';
                        }
                        return null;
                      },
                    ),
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
                    TextInput(
                      icon: const Icon(Icons.class_outlined),
                      controller: deptController,
                      hint: 'Department',
                      keyboardType: TextInputType.emailAddress,
                      isObscured: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your department';
                        }
                        return null;
                      },
                    ),
                    TextInput(
                      icon: const Icon(Icons.lock_outline),
                      controller: passwordController,
                      hint: 'Password',
                      keyboardType: TextInputType.text,
                      isObscured: true,
                      validator: (value) {
                        if (value.length < 8) {
                          return 'Password must at least 8 characters';
                        } else if (value == null || value.isEmpty) {
                          return 'Enter your email';
                        }
                        return null;
                      },
                    ),
                    TextInput(
                      icon: const Icon(Icons.lock_outline),
                      controller: confirmPasswordController,
                      hint: 'Confirm password',
                      keyboardType: TextInputType.text,
                      isObscured: true,
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
                ),
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {},
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
