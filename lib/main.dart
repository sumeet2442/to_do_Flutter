import 'package:flutter/material.dart';
import 'package:to_do_app/Pages/greet_user.dart';
import 'package:to_do_app/Pages/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todo(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        backgroundColor: Colors.indigo,
        // elevation: 40,
        // shadowColor: Colors.black54
      )),
    );
  }
}
