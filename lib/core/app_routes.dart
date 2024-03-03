import 'package:first_flutter_app/navigation/advance/teacher_search_navigator.dart';
import 'package:first_flutter_app/navigation/intermediate/home_page_intemediate.dart';
import 'package:first_flutter_app/navigation/intermediate/profile_page_intermediate.dart';
import 'package:first_flutter_app/navigation/intermediate/settings_page_intermediate.dart';
import 'package:flutter/material.dart';

class AppRoutes {

  static Map<String, WidgetBuilder> configureRoute() {
    return {
      HomePageIntermediate.path: (context) => const HomePageIntermediate(),
      ProfilePageIntermediate.path: (context) {
        String userName = ModalRoute.of(context)?.settings.arguments as String;
        return ProfilePageIntermediate(userName: userName);
      },
      SettingsPageIntermediate.path: (context) => const SettingsPageIntermediate(),

      TeacherSearchNavigator.path: (context) => const TeacherSearchNavigator(),
    };
  }
}