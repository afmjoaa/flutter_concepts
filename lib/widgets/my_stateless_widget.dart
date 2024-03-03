import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  final String text;

  const MyStatelessWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is my stateless widget"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lime,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }


}
