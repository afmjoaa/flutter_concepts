import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_data_container.dart';
import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_inherited_widget.dart';
import 'package:first_flutter_app/navigation/advance/screens/search_summary_screen.dart';
import 'package:flutter/material.dart';

class GenderPreferenceScreen extends StatefulWidget {
  static const String path = "gender_preference";

  const GenderPreferenceScreen({super.key});

  @override
  State<GenderPreferenceScreen> createState() => _GenderPreferenceScreenState();
}

class _GenderPreferenceScreenState extends State<GenderPreferenceScreen> {
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
          title: const Text('Gender Preference Screen'),
        ),
        backgroundColor: Colors.pinkAccent.shade100,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: "Female",
                    labelText: "Enter the gender preference",
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
                    if( enteredText.toLowerCase() == "male" ) {
                      _dataContainer?.genderPreference = Gender.male;
                    }else {
                      _dataContainer?.genderPreference = Gender.female;
                    }
                    Navigator.pushNamed(context, SearchSummaryScreen.path);
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
