import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_chop/pages/welcome_page.dart';
import 'package:quick_chop/theme/theme_provider.dart';
import 'package:appwrite/appwrite.dart'; // Import the Appwrite library
import 'package:quick_chop/services/auth_service.dart'; // Import your AuthService

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the Appwrite client
  final Client client = Client();
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('6606bae6508058e6bdf9');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthService(client), // Provide AuthService
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Chop',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: const WelcomePage(),
    );
  }
}
