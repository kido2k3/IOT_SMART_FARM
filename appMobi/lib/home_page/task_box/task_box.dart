
import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:flutter/material.dart';

class TaskBox extends StatefulWidget {
  const TaskBox({super.key});

  @override
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30)),
      margin:const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      padding:const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Task lists", style: MyTextStyle.welcome),
          Text("Running...", style: MyTextStyle.weather),
          Text("Waiting...", style: MyTextStyle.weather),
        ],
      ),
    );
  }
}
