// import 'package:appwrite/appwrite.dart';
// import 'package:appwrite/models.dart';
// import 'package:flutter/material.dart';

// class AuthService with ChangeNotifier {
//   late final Account account;
//   late Token token;
//   late Session user;
//   late String phoneNumber;
//   late Map<String, dynamic> userData;

//   AuthService(Client client) {
//     account = Account(client);
//   }

//   // Function for user registration with additional data
//   Future<void> registerWithPhone(
//       String phoneNumber,
//       String password,
//       Map<String, dynamic> moreInfo,
//       Function nextScreen,
//       Function handleAuthError) async {
//     try {
//       this.phoneNumber = phoneNumber;
//       this.userData = {
//         'password': password,
//         'name': moreInfo['name'],
//         'level': moreInfo['level'],
//         // Add more fields as needed
//       };

//       // Create phone session without OTP
//       token = await account.createPhoneSession(
//           userId: ID.unique(), phone: phoneNumber);

//       nextScreen();
//     } catch (e) {
//       print(e);
//       handleAuthError();
//     }
//   }

//   // Function for verifying OTP and completing registration
//   Future<void> verifyOtpAndRegister(
//       String otp, Function nextScreen, Function handleAuthError) async {
//     try {
//       await account.updatePhoneSession(userId: token.userId, secret: otp);

//       // Once OTP is verified, create user account with additional data
//       await createUserWithAdditionalData();

//       nextScreen();
//     } catch (e) {
//       print(e);
//       handleAuthError();
//     }
//   }

//   // Function for user login with phone number and password
//   Future<void> loginWithPhoneAndPassword(String phoneNumber, String password,
//       Function nextScreen, Function handleAuthError) async {
//     try {
//       user = await account.createEmailSession(
//         email:
//             '', // Email is required, but we don't have it, so we use an empty string
//         password: password,
//       );

//       nextScreen();
//     } catch (e) {
//       print(e);
//       handleAuthError();
//     }
//   }

//   // Function to create user account with additional data
//   Future<void> createUserWithAdditionalData(password) async {
//     try {
//       // Create a new user document with phone number and additional data
//       Map<String, dynamic> userDocument = {
//         'phone': phoneNumber,
//         'name': userData['name'],
//         'level': userData['level'],
//         // Add more fields as needed
//       };

//       // Use Appwrite's User API to create a new user document
//       await account.create(
//         userId: user.userId,
//         email: '', // Your users collection ID in Appwrite
//         password: password,
//       );
//     } catch (e) {
//       print(e);
//       // Handle error if user creation fails
//     }
//   }
// }
