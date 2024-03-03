import 'package:first_flutter_app/bloc/employee_ui.dart';
import 'package:first_flutter_app/core/app_routes.dart';
import 'package:first_flutter_app/navigation/advance/teacher_search_navigator.dart';
import 'package:first_flutter_app/navigation/basic/home_page.dart';
import 'package:first_flutter_app/navigation/intermediate/home_page_intemediate.dart';
import 'package:first_flutter_app/widgets/future_builder_widget.dart';
import 'package:first_flutter_app/widgets/my_stateful_widget.dart';
import 'package:first_flutter_app/widgets/my_stateless_widget.dart';
import 'package:first_flutter_app/widgets/stream_builder_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      routes: AppRoutes.configureRoute(),
      // initialRoute: "/",
      home: const MyHomePage(title: 'Stateless vs Stateful'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const MyStatelessWidget(text: "This is the param text"),
                    ),
                  );
                },
                child: const Text(
                    "Navigate to stateless widget",
                  style: TextStyle(
                    color: Colors.deepPurple
                  ),
                ),
            ),

            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const MyStatefulWidget(text: "This is the param text"),
                  ),
                );
              },
              child: const Text(
                "Navigate to stateful widget",
                style: TextStyle(
                    color: Colors.teal
                ),
              ),
            ),

            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const FutureBuilderWidget(),
                  ),
                );
              },
              child: const Text(
                "Navigate to future builder widget",
                style: TextStyle(
                    color: Colors.pink
                ),
              ),
            ),

            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const StreamBuilderWidget(),
                  ),
                );
              },
              child: const Text(
                "Navigate to stream builder widget",
                style: TextStyle(
                    color: Colors.deepOrange
                ),
              ),
            ),

            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const EmployeeUi(),
                  ),
                );
              },
              child: const Text(
                "Navigate to Employee bloc widget",
                style: TextStyle(
                    color: Colors.black87
                ),
              ),
            ),

            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const HomePage(),
                  ),
                );
              },
              child: const Text(
                "Basic Navigation",
                style: TextStyle(
                    color: Colors.indigo
                ),
              ),
            ),

            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //     const HomePage(),
                //   ),
                // );
                Navigator.of(context).pushNamed(
                  HomePageIntermediate.path,
                );
              },
              child: const Text(
                "Intermediate Navigation",
                style: TextStyle(
                    color: Colors.purple
                ),
              ),
            ),

            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  TeacherSearchNavigator.path,
                );
              },
              child: const Text(
                "Advance Navigation",
                style: TextStyle(
                    color: Colors.green
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
