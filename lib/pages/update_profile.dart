import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_chop/services/user_service.dart';
import 'package:quick_chop/utils/cart_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _detailsFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  var levelController = TextEditingController();
  var deptController = TextEditingController();

  var oldPasswordController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context, listen: false);

    final userData = Provider.of<UserService>(context).currentUserData;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Edit profile'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
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
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(userData[
                                  'profile_img'] ??
                              'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
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
                DetailsForm(
                    detailsFormKey: _detailsFormKey,
                    levelController: levelController,
                    deptController: deptController,
                    passwordFormKey: _passwordFormKey,
                    oldPasswordController: oldPasswordController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController),
                // const Spacer(),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isloading = true;
                        });
                        if (_detailsFormKey.currentState!.validate()) {
                          userService.updateUserInfo(
                            userInfo: {
                              'level': levelController.text,
                              'department': deptController.text,
                            },
                            nextStep: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.green,
                                  content: Text('Profile updated successfully'),
                                ),
                              );
                            },
                            handleError: (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.red,
                                  content: Text(error),
                                ),
                              );
                            },
                          ).then((value) => setState(() {
                                isloading = false;
                              }));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: isloading == true
                          ? const CircularProgressIndicator(
                              backgroundColor: Colors.transparent,
                              color: Colors.white,
                              strokeWidth: 2,
                            )
                          : Text(
                              'Save changes',
                              style: GoogleFonts.poppins(),
                            ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isloading = true;
                        });

                        if (_passwordFormKey.currentState!.validate()) {
                          userService.updatePassword(
                            oldPasswordController.text,
                            passwordController.text,
                            nextStep: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.red,
                                  content:
                                      Text('Password updated successfully'),
                                ),
                              );
                              Navigator.pop(context);
                            },
                            handleError: (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.green,
                                  content: Text("Check the old password"),
                                ),
                              );
                            },
                          ).then((value) {
                            setState(
                              () {
                                isloading = false;
                              },
                            );
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: isloading == true
                          ? const CircularProgressIndicator(
                              backgroundColor: Colors.transparent,
                              color: Colors.white,
                              strokeWidth: 2,
                            )
                          : Text(
                              'Change Password',
                              style: GoogleFonts.poppins(),
                            ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
