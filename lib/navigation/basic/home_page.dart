import 'package:first_flutter_app/navigation/basic/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String path = "main/home_page";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: Container(
        color: Colors.deepPurpleAccent.shade100,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const ProfilePage(userName: 'Masum Mridha',);
                    })
                );
              },
              child: const Text("Navigate to profile page"),
            )
          ],
        ),
      ),
    );
  }
}
