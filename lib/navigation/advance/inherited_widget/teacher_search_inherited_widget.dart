import 'package:first_flutter_app/navigation/advance/inherited_widget/teacher_search_data_container.dart';
import 'package:flutter/cupertino.dart';

class TeacherSearchInheritedWidget extends InheritedWidget {

  const TeacherSearchInheritedWidget(
      {super.key,
        required super.child,
        required this.dataContainer,
      });

  final TeacherSearchDataContainer dataContainer;


  static TeacherSearchInheritedWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TeacherSearchInheritedWidget>();
  }

  static TeacherSearchInheritedWidget of(BuildContext context) {
    final TeacherSearchInheritedWidget? result = maybeOf(context);
    assert(result != null, 'No TeacherSearchInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TeacherSearchInheritedWidget oldWidget) => dataContainer != oldWidget.dataContainer;

}