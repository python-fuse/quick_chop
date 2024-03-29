// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class VerifyOTP extends StatelessWidget {
  final String? currentPhone;

  // final String verificationId;

  VerifyOTP({
    super.key,
    this.currentPhone,
    // required this.verificationId,
  });

  String otp = '';
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
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Verification',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 52,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Enter the OTP Code we sent you at',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                currentPhone!,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: OTPTextField(
                  length: 6,
                  fieldWidth: 40,
                  margin: const EdgeInsets.all(3),
                  contentPadding: const EdgeInsets.all(3),
                  otpFieldStyle: OtpFieldStyle(
                    enabledBorderColor: Colors.grey,
                    focusBorderColor: Theme.of(context).colorScheme.primary,
                  ),
                  fieldStyle: FieldStyle.box,
                  textFieldAlignment: MainAxisAlignment.spaceBetween,
                  onCompleted: (pin) {
                    otp = pin;
                  },
                ),
              ),
              Row(
                children: [
                  const Text(
                    "Didn't recieve SMS?",
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
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
                      "Verify",
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
