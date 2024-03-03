import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderWidget extends StatefulWidget {
  const StreamBuilderWidget({super.key});

  @override
  State<StreamBuilderWidget> createState() => _StreamBuilderWidgetState();
}

class _StreamBuilderWidgetState extends State<StreamBuilderWidget> {
  late TextEditingController _controller;
  late StreamController<List<String>> _msgController;
  List<String> _messageHistory = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _msgController = StreamController();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _messageHistory.add(_controller.text);
      _msgController.sink.add(_messageHistory);
      // setState(() {
      //   _messageHistory.add(_controller.text);
      // });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("I am inside main build method");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Builder Widget Demo"),
      ),
      body: ListView(
        children: [
          StreamBuilder(
            stream: _msgController.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print("I am inside second stream builder build method");
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index]),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("No msg yet..."),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration:
                    const InputDecoration(hintText: "Write you msg here...."),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: Icon(Icons.send),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getMsgHistoryWidget() {
    if (_messageHistory.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: _messageHistory.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_messageHistory![index]),
          );
        },
      );
    } else {
      return const Center(
        child: Text("No msg yet..."),
      );
    }
  }

  @override
  void dispose() {
    _controller.clear();
    _msgController.close();
    super.dispose();
  }
}
