import 'package:flutter/material.dart';

class greetUser extends StatefulWidget {
  const greetUser({super.key});

  @override
  State<greetUser> createState() => _greetUserState();
}

class _greetUserState extends State<greetUser> {
  String greetUser = "";

//this widget is for storing the data in the textfield
  TextEditingController textController = TextEditingController();

  void greetUserMeth() {
    setState(() {
      // ignore: prefer_interpolation_to_compose_strings
      greetUser = "Hello, " + textController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  greetUser,
                  style: TextStyle(fontSize: 40),
                ),
              ),
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Enter your name..",
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                  onPressed: greetUserMeth, child: Text("Enter Data"))
            ],
          ),
        ),
      ),
    );
  }
}
