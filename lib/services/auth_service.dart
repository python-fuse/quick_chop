import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  late final Account account;
  late final Databases databases;
  late Token user;

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
