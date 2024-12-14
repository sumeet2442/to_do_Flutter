// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/Components/my_btn.dart';

class DialogBox extends StatelessWidget {
  final textController;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.textController,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xff080c1e),
      content: Container(
        height: 180,
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white70,
                    focusColor: Colors.white70,
                    hintText: "Add a new task"),
                style: TextStyle(color: Colors.white60),
                controller: textController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyBtn(text: "Save", onTap: onSave),
                ),
                MyBtn(text: "Cancel", onTap: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
