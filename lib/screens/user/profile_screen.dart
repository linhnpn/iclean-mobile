import 'package:flutter/material.dart';
import 'package:iclean_flutter/models/account.dart';
import 'package:iclean_flutter/screens/user/location_screen.dart';
import 'package:iclean_flutter/screens/user/payment_screen.dart';
import 'package:iclean_flutter/screens/user/update_profile_screen.dart';
import '../common/user_preferences.dart';
import '../common/login_screen.dart';
import 'add_location_screen.dart';

class ProfileScreen extends StatefulWidget {
  final Account account;
  const ProfileScreen({Key? key, required this.account}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _logout() async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
    await UserPreferences.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/10.jpg'),
                    radius: 50,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.account.fullname,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateProfileScreen(
                                  account: widget.account)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.person_outline),
                              SizedBox(width: 15),
                              Text(
                                "Edit Profile",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (widget.account.locationName.isEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddLocationScreen(
                                      defaultOrNot: true,
                                    )));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LocationScreen()));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.location_on_outlined),
                              SizedBox(width: 15),
                              Text(
                                "Location",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.notifications_outlined),
                            SizedBox(width: 15),
                            Text(
                              "Notification",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.payment_outlined),
                              SizedBox(width: 15),
                              Text(
                                "Payment",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.language_outlined),
                            SizedBox(width: 15),
                            Text(
                              "Language",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.remove_red_eye_outlined),
                            SizedBox(width: 15),
                            Text(
                              "Dark Mode",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.policy_outlined),
                            SizedBox(width: 15),
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return Colors.red.withOpacity(0.2);
                            } else {
                              return Colors.transparent;
                            }
                          },
                        ),
                        mouseCursor: MaterialStateProperty.all<MouseCursor>(
                            SystemMouseCursors.click),
                      ),
                      onPressed: () => showLogoutConfirmationDialog(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.logout,
                                color: Colors.red,
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Log out",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Log Out"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.deepPurple.shade300),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.deepPurple.shade300,
                ),
              ),
              onPressed: _logout,
              child: const Text("Log Out"),
            ),
          ],
        );
      },
    );
  }
}
