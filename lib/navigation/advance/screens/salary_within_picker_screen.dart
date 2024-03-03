import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_data_container.dart';
import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_inherited_widget.dart';
import 'package:first_flutter_app/navigation/advance/screens/gender_preference_screen.dart';
import 'package:flutter/material.dart';

class SalaryWithinPickerScreen extends StatefulWidget {
  static const String path = "salary_within";

  const SalaryWithinPickerScreen({super.key});

  @override
  State<SalaryWithinPickerScreen> createState() => _SalaryWithinPickerScreenState();
}

class _SalaryWithinPickerScreenState extends State<SalaryWithinPickerScreen> {
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
          title: const Text('Salary Picker Screen'),
        ),
        backgroundColor: Colors.yellowAccent.shade200,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: "1000 bdt",
                    labelText: "Enter the salary",
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
                    _dataContainer?.salaryWithin = enteredText;

                    Navigator.pushNamed(context, GenderPreferenceScreen.path);
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
