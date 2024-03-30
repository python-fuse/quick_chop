import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  late final Account account;
  late final Databases database;
  late Token user;

  AuthService(Client client) {
    account = Account(client);
    database = Databases(client);
  }

  // Function to add email, name and password to the current account
  Future<void> updateUser(
      String email, String password, String fullName,Function nextStep,Function handleError) async {
    try {
      await account.updateEmail(email: email, password: password);
      await account.updateName(name: fullName);
      nextStep();
    } catch (e) {
    print(e);
      handleError();
    }
  }

  Future login(
      String email, String password, nextStep, handleLoginError) async {
    try {
      await account.createEmailSession(email: email, password: password);
      nextStep();
    } catch (e) {
    print(e);
      handleLoginError();
    }
  }

  Future<void> registerWithPhoneSession(
      String phoneNumber, Function nextScreen, Function handleAuthError) async {
    try {
      user = await account.createPhoneSession(
          userId: ID.unique(), phone: phoneNumber);
      nextScreen();
    } catch (e) {
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
      handleAuthError();
    }
  }

  // logout

  Future<void> logout() async {
    try {
      await account.deleteSession(sessionId: 'current');
    } catch (e) {
      return;
    }
  }
}
