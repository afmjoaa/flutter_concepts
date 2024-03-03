import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  final String text;

  const MyStatefulWidget({super.key, required this.text});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late String myText;
  late StreamController<String> _streamController;

  @override
  void initState() {
    super.initState();
    print("This is my initState method...");
    myText = widget.text;
    _streamController = StreamController();
    _streamController.sink.add(myText);
  }

  @override
  Widget build(BuildContext context) {
    print("This is my build method...");
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is my Stateful widget..."),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
            onPressed: () {
              int value = Random().nextInt(100);
              myText = "My text is changed $value....";
              _streamController.sink.add(myText);
              // setState(() {
              //   int value = Random().nextInt(100);
              //   myText = "My text is changed $value....";
              // });
            },
            child: const Text("Change my state"),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              color: Colors.deepPurpleAccent,
              child:
              // Text(
              //   myText,
              //   style: const TextStyle(
              //     fontSize: 16,
              //   ),
              // ),
              StreamBuilder<String>(
                  stream: _streamController.stream,
                  builder: (context, snapshot) {
                    print("This is my Stream builder build method...");
                    return Text(
                      snapshot.hasData ? snapshot.data ?? "" : "No Data...",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    );
                  },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
