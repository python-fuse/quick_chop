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
  bool isloading = false;

  final _formKey = GlobalKey<FormState>();

  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var levelController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String handleError(error) {
      switch (error) {
        case 'user_phone_already_exists	':
          return 'Account already exists, Please login';
        default:
          return 'Something went wrong, Try again';
      }
    }

    String phoneNumber = phoneController.text;
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
                    fontSize: 57,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(height: 20),
              Text(
                'Enter your phone number to get started',
                style: TextStyle(
                    fontSize: 19,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),

              const SizedBox(height: 40),

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
                    if (value.length > 11) {
                      return 'Number too long';
                    } else if (value == null ||
                        value.isEmpty ||
                        value.length < 10) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      isloading = true;
                    });
                    // If the form is valid, send otp.
                    authService.registerWithPhoneSession(
                        "+234${phoneNumber.length == 11 ? phoneNumber.substring(1) : phoneNumber}",
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyOTP(
                            currentPhone:
                                "+234${phoneNumber.length == 11 ? phoneNumber.substring(1) : phoneNumber}",
                          ),
                        ),
                      );
                    }, (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          content: Text(handleError(e)),
                        ),
                      );
                    }).then(
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
                      color: Theme.of(context).colorScheme.primary),
                  width: double.infinity,
                  child: Center(
                    child: isloading == true
                        ? const CircularProgressIndicator(
                            backgroundColor: Colors.transparent,
                            color: Colors.white,
                            strokeWidth: 2,
                          )
                        : const Text(
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
