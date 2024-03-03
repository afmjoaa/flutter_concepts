import 'package:first_flutter_app/navigation/basic/settings_page.dart';
import 'package:first_flutter_app/navigation/intermediate/settings_page_intermediate.dart';
import 'package:flutter/material.dart';

class ProfilePageIntermediate extends StatelessWidget {
  static const String path = "main/profile_page_intermediate";

  final String userName;

  const ProfilePageIntermediate({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile page intermediate"),
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
                 Navigator.of(context).pushReplacementNamed(
                   SettingsPageIntermediate.path,
                 );
                 // Navigator.pushReplacement(
                 //     context,
                 //     MaterialPageRoute(builder: (context) {
                 //       return const SettingsPage();
                 //     })
                 // );
               },
               child: const Text("Replace to setting page"),
             )
           ],
        ),
      ),
    );
  }
}
