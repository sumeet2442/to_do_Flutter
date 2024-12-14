import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/Pages/greet_user.dart';
import 'package:to_do_app/Pages/todo.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('hiveBox');

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
