import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FutureBuilderWidget extends StatefulWidget {
  const FutureBuilderWidget({super.key});

  @override
  State<FutureBuilderWidget> createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  Future<Map<String, dynamic>> fetchUserData() async {
    await Future.delayed(const Duration(seconds: 5));
    final response = await get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
    if ( response.statusCode == 200) {
      return json.decode(response.body);
    }else {
      throw Exception("Failed to get the data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Builder Widget Demo"),
      ),
      body: FutureBuilder(
        future: fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child:  CircularProgressIndicator(),
            );
          } else if(snapshot.hasError) {
            return Center(
              child: Text("We got an Error: ${snapshot.error}"),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('User ID: ${snapshot.data?['id']}'),
                  Text('User ID: ${snapshot.data?['name']}'),
                  Text('User ID: ${snapshot.data?['email']}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
