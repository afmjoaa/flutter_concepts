import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_data_container.dart';
import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_inherited_widget.dart';
import 'package:first_flutter_app/navigation/advance/screens/topic_picker_screen.dart';
import 'package:flutter/material.dart';

class LevelPickerScreen extends StatefulWidget {
  static const String path = "level_picker";

  const LevelPickerScreen({super.key});

  @override
  State<LevelPickerScreen> createState() => _LevelPickerScreenState();
}

class _LevelPickerScreenState extends State<LevelPickerScreen> {
  late final TextEditingController _textEditingController;
  TeacherSearchDataContainer? _dataContainer;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _dataContainer = TeacherSearchInheritedWidget.of(context).dataContainer;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Level Picker Screen'),
        ),
        backgroundColor: Colors.tealAccent.shade100,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: "HSC",
                    labelText: "Enter the level",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String enteredText = _textEditingController.text;
                    _dataContainer?.classLevel = enteredText;

                    Navigator.pushNamed(context, TopicPickerScreen.path);
                  },
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _textEditingController.clear();
    super.dispose();
  }
}
