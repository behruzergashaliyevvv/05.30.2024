import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home_screen.dart';

import 'controllers/plan_controller.dart';
import 'controllers/note_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlanController()),
        ChangeNotifierProvider(create: (context) => NoteController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(toggleTheme: toggleTheme),
    );
  }
}
