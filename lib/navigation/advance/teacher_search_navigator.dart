import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_data_container.dart';
import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_inherited_widget.dart';
import 'package:first_flutter_app/navigation/advance/screens/gender_preference_screen.dart';
import 'package:first_flutter_app/navigation/advance/screens/level_picker_screen.dart';
import 'package:first_flutter_app/navigation/advance/screens/location_picker_screen.dart';
import 'package:first_flutter_app/navigation/advance/screens/salary_within_picker_screen.dart';
import 'package:first_flutter_app/navigation/advance/screens/search_summary_screen.dart';
import 'package:first_flutter_app/navigation/advance/screens/topic_picker_screen.dart';
import 'package:flutter/material.dart';

class TeacherSearchNavigator extends StatelessWidget {
  static const String path = "main/teacher_search_navigator";

  const TeacherSearchNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return TeacherSearchInheritedWidget(
      dataContainer: TeacherSearchDataContainer(),
      child: Navigator(
        initialRoute: LocationPickerScreen.path,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          builder = switch (settings.name) {
            LocationPickerScreen.path => (_) => const LocationPickerScreen(),
            LevelPickerScreen.path => (_) => const LevelPickerScreen(),
            TopicPickerScreen.path => (_) => const TopicPickerScreen(),
            SalaryWithinPickerScreen.path => (_) => const SalaryWithinPickerScreen(),
            GenderPreferenceScreen.path => (_) => const GenderPreferenceScreen(),
            SearchSummaryScreen.path => (_) => const SearchSummaryScreen(),
            _ => throw Exception("Invalid route: ${settings.name}")
          };
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}
