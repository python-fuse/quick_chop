import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  late final Account account;
  late Token user;
  

  AuthService(Client client) {
    account = Account(client);
  }

  Future<void> registerWithPhoneSession(
      String phoneNumber, Function nextScreen, Function handleAuthError) async {
    try {
      user = await account.createPhoneSession(
          userId: ID.unique(), phone: phoneNumber);
      nextScreen();
    } catch (e) {
      print(e);
      handleAuthError();
    }
  }

  // Function to verify the OTP
  Future<void> verifyOtp(
      String otp, Function nextScreen, Function handleAuthError) async {
    try {
      await account.updatePhoneSession(userId: user.userId, secret: otp);
      nextScreen();
    } catch (e) {
      print(e);
      handleAuthError();
    }
  }
}
