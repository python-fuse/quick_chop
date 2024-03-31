import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

class UserService with ChangeNotifier {
  late final Account account;
  late final Databases databases;
  late User user;
  Map currentUserData = {};

  UserService(Client client) {
    account = Account(client);
    databases = Databases(client);
  }

  //function to get current user data

  Future<void> getCurrentUser() async {
    try {
      user = await account.get();
      Document res = await databases.getDocument(
        databaseId: 'quickchop',
        collectionId: 'users',
        documentId: user.$id,
      );
      currentUserData = res.data;

      notifyListeners();
    } catch (e) {
      return;
    }
  }
}
