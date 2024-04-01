import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_chop/pages/login_page.dart';
import 'package:quick_chop/services/auth_service.dart';
import 'package:quick_chop/services/user_service.dart';
import 'package:quick_chop/utils/info_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final user = Provider.of<UserService>(context).user;
    final userData = Provider.of<UserService>(context).currentUserData;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      //make a profile page including user pic in a circle,name, theme change button,edit profile and a logout button at the bottom

      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/ball.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.black,
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 61, 61, 61),
                                blurRadius: 8,
                                spreadRadius: 2),
                          ]),
                      child: const CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('lib/assets/user.png'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(userData['fullName'],
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  InfoCard(
                    icon: Icons.phone_outlined,
                    title: user.phone,
                  ),
                  InfoCard(
                    icon: Icons.email_outlined,
                    title: user.email,
                  ),
                  InfoCard(
                    icon: Icons.school_outlined,
                    title: userData['department'],
                  ),
                  InfoCard(
                    icon: Icons.abc_outlined,
                    title: "Level ${userData['level']}",
                  ),
                ],
              ),
              const Spacer(),

              // row of edit profile and login buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement edit profile functionality
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text('Edit Profile'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      authService.logout(
                        nextStep: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => const LoginPage()));
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      'Log out',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10)
            ],
          ),
        ],
      ),
    );
  }
}
