import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_chop/services/auth_service.dart';
import 'package:quick_chop/utils/text_input.dart';

class FinishSetup extends StatefulWidget {
  const FinishSetup({super.key});

  @override
  State<FinishSetup> createState() => _FinishSetupState();
}

class _FinishSetupState extends State<FinishSetup> {
  final _formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var levelController = TextEditingController();
  var deptController = TextEditingController();
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
                "Let's finish setting up your account",
                textAlign: TextAlign.start,
                style: GoogleFonts.lato(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              Text(
                'Fill in your information',
                
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const Text(
                "Do not exit the app before this step!",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),

              const SizedBox(height: 5),

              // Phone input
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextInput(
                      icon: const Icon(Icons.person_outline),
                      controller: nameController,
                      hint: 'Full name',
                      keyboardType: TextInputType.text,
                      isObscured: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your full name';
                        }
                        return null;
                      },
                    ),
                    
                              const SizedBox(height: 10),
                              
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
                    
                              const SizedBox(height: 10),
                              	
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
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    authService.updateUser(emailController.text,
                        passwordController.text, nameController.text, () {
                      Navigator.of(context).pushNamed('/home');
                    }, () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('An error occurred, please try again'),
                        ),
                      );
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
                      "Finish",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
