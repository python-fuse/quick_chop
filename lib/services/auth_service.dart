import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  late final Account account;
  late final Databases databases;
  late Token user;
  late Document currentUser;

  AuthService(Client client) {
    account = Account(client);
    databases = Databases(client);
  }

  // Function to add email, name and password to the current account
  Future<void> updateUser({
    required String email,
    required String password,
    required String fullName,
    required Function nextStep,
    required Function handleError,
    required String level,
    required String department,
  }) async {
    try {
      await account.updateEmail(email: email, password: password);
      await account.updateName(name: fullName);
      await saveUserData(fullName, level, department);
      nextStep();
    } catch (e) {
      handleError();
    }
  }

  Future login(
      String email, String password, nextStep, handleLoginError) async {
    try {
      await account.createEmailSession(email: email, password: password);
      nextStep();
    } on AppwriteException catch (e) {
      handleLoginError(e);
    }
  }

  Future<void> registerWithPhoneSession(
      String phoneNumber, Function nextScreen, Function handleAuthError) async {
    try {
      user = await account.createPhoneSession(
          userId: ID.unique(), phone: phoneNumber);
      nextScreen();
    } on AppwriteException catch (e) {
      handleAuthError(e.type);
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

// resend otp

  Future<void> resendOtp(phoneNumber) async {
    await account.createPhoneSession(userId: user.userId, phone: phoneNumber);
  }

  // logout

  Future<void> logout({required nextStep}) async {
    try {
      await account.deleteSession(sessionId: 'current');
      nextStep();
    } catch (e) {
      return;
    }
  }

  //saving user data to the database

  Future<void> saveUserData(fullname, level, department) async {
    await databases.createDocument(
      databaseId: 'quickchop',
      collectionId: 'users',
      documentId: user.userId,
      data: {
        'userId': user.userId,
        'fullName': fullname,
        'level': level,
        'department': department,
      },
    );
  }
}
