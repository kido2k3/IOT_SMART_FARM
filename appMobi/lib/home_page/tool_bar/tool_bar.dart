

import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:flutter/material.dart';

class ToolBar extends StatefulWidget {
  const ToolBar({super.key});

  @override
  State<ToolBar> createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(25)),
      margin:const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.add_circle_outline_outlined, size: 40)
              ),
              Text(
                'New task',
                textAlign: TextAlign.center,
                style: MyTextStyle.weather
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.history_outlined, size: 40)
              ),
              Text(
                  'Log',
                  textAlign: TextAlign.center,
                  style: MyTextStyle.weather
              ),
            ],
          )
        ],
      ),
    );
  }
}
