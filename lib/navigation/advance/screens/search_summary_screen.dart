import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_data_container.dart';
import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_inherited_widget.dart';
import 'package:flutter/material.dart';

class SearchSummaryScreen extends StatelessWidget {
  static const String path = "search_summary";

  const SearchSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TeacherSearchDataContainer dataContainer = TeacherSearchInheritedWidget.of(context).dataContainer;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Summary Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Text("Location Radius: ${dataContainer.searchRadius}"),
              const SizedBox(height: 10,),

              Text("Level: ${dataContainer.classLevel}"),
              const SizedBox(height: 10,),

              Text("Topic: ${dataContainer.topic}"),
              const SizedBox(height: 10,),

              Text("Salary Within: ${dataContainer.salaryWithin}"),
              const SizedBox(height: 10,),

              Text("Gender Preference: ${dataContainer.genderPreference.name}"),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      )
    );
  }
}
