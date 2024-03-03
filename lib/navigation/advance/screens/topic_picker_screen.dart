import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_data_container.dart';
import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_inherited_widget.dart';
import 'package:first_flutter_app/navigation/advance/screens/salary_within_picker_screen.dart';
import 'package:flutter/material.dart';

class TopicPickerScreen extends StatefulWidget {
  static const String path = "topic_picker";

  const TopicPickerScreen({super.key});

  @override
  State<TopicPickerScreen> createState() => _TopicPickerScreenState();
}

class _TopicPickerScreenState extends State<TopicPickerScreen> {
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
          title: const Text('Topic Picker Screen'),
        ),
        backgroundColor: Colors.red.shade100,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: "Physics",
                    labelText: "Enter the topic",
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
                    _dataContainer?.topic = enteredText;

                    Navigator.pushNamed(context, SalaryWithinPickerScreen.path);
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
