import 'package:first_flutter_app/navigation/intermediate/home_page_intemediate.dart';
import 'package:flutter/material.dart';

class SettingsPageIntermediate extends StatelessWidget {
  static const String path = "main/settings_page_intermediate";

  const SettingsPageIntermediate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings page intermediate"),
      ),
      body: Container(
        color: Colors.tealAccent.shade200,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This is settings page"),
            const SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("pop"),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                // Navigator.popUntil(context, ModalRoute.withName('/'));

                Navigator.popUntil(context, (route) {
                  print('Current route name: ${route.settings.name}');
                  return route.settings.name == '/';
                });

                // Navigator.pop(context);
                // Navigator.pop(context);
              },
              child: const Text("pop and remove until"),
            )
          ],
        ),
      ),
    );
  }
}
