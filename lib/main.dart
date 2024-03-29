import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_chop/pages/welcome_page.dart';
import 'package:quick_chop/theme/theme_provider.dart';

void main() async {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
