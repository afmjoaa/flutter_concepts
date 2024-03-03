import 'package:first_flutter_app/navigation/basic/profile_page.dart';
import 'package:first_flutter_app/navigation/intermediate/profile_page_intermediate.dart';
import 'package:flutter/material.dart';

class HomePageIntermediate extends StatelessWidget {
  static const String path = "main/home_page_intermediate";

  const HomePageIntermediate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page intermediate"),
      ),
      body: Container(
        color: Colors.deepPurpleAccent.shade100,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  ProfilePageIntermediate.path,
                  arguments: "Faysal Hossain",
                );
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) {
                //       return const ProfilePage(userName: 'Prattoy',);
                //     })
                // );
              },
              child: const Text("Navigate to profile page"),
            )
          ],
        ),
      ),
    );
  }
}
