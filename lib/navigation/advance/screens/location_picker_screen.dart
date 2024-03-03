import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_data_container.dart';
import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_inherited_widget.dart';
import 'package:first_flutter_app/navigation/advance/screens/level_picker_screen.dart';
import 'package:flutter/material.dart';

class LocationPickerScreen extends StatefulWidget {
  static const String path = "location_picker";

  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
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
          title: const Text('Location Picker Screen'),
        ),
        backgroundColor: Colors.purple.shade100,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: "10 KM",
                    labelText: "Enter the location radius",
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
                    _dataContainer?.searchRadius = enteredText;

                    Navigator.pushNamed(context, LevelPickerScreen.path);
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
