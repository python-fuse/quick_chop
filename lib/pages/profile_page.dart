import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_chop/pages/login_page.dart';
import 'package:quick_chop/services/auth_service.dart';
import 'package:quick_chop/theme/theme_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          automaticallyImplyLeading: false,
        ),

        //make a profile page including user pic in a circle,name, theme change button,edit profile and a logout button at the bottom

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('lib/assets/user.png'),
              ),
              const SizedBox(height: 10),
              const Text('User Name'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
                child: const Text('Change Theme'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  //edit profile
                },
                child: const Text('Edit Profile'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  authService.logout(
                    nextStep: Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    ),
                  );
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ));
  }
}
