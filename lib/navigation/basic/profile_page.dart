import 'package:first_flutter_app/navigation/basic/settings_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String path = "main/profile_page";

  final String userName;

  const ProfilePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile page"),
      ),
      body: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Profile: $userName"),
             ElevatedButton(
               onPressed: () {
                 Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(builder: (context) {
                       return const SettingsPage();
                     })
                 );
               },
               child: const Text("Replace to setting page"),
             )
           ],
        ),
      ),
    );
  }
}
