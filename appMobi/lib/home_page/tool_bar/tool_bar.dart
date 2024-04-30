import 'package:app_mobi/home_page/tool_bar/tool_bar_presenter.dart';
import 'package:app_mobi/home_page/tool_bar/tool_bar_view.dart';
import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:flutter/material.dart';

class ToolBar extends StatefulWidget {
  const ToolBar({super.key});

  @override
  State<ToolBar> createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> implements ToolBarView {
  bool _isConnected = true;
  late ToolBarPresenter _presenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = toolBarPresenter;
    _presenter.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(25)),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                  onPressed: _isConnected
                      ? null : () {_presenter.newtaskOnPressed(context);},
                  icon: const Icon(Icons.add_circle_outline, size: 40)),
              Text('New task',
                  textAlign: TextAlign.center, style: MyTextStyle.weather),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.history, size: 40)),
              Text('Log',
                  textAlign: TextAlign.center, style: MyTextStyle.weather),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: _isConnected
                      ? null : (){_presenter.serverOnPressed(context);},
                  icon: Icon(_isConnected ? Icons.sensors : Icons.sensors_off,
                      size: 40)),
              Text('Server',
                  textAlign: TextAlign.center, style: MyTextStyle.weather),
            ],
          )
        ],
      ),
    );
  }



  @override
  void setStatus(bool status) {
    // TODO: implement updateStatus
    setState(() {
      _isConnected = status;
    });
  }
}
