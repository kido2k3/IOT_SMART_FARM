import 'package:app_mobi/home_page/tool_bar/tool_bar_presenter.dart';
import 'package:app_mobi/home_page/tool_bar/tool_bar_view.dart';
import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:flutter/material.dart';

class ToolBar extends StatefulWidget {
  const ToolBar({Key? key}) : super(key: key);

  @override
  State<ToolBar> createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> implements ToolBarView {
  bool _isConnected = true;
  late ToolBarPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = toolBarPresenter;
    _presenter.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(25),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildButton(
            onPressed: !_isConnected ? null : () => _presenter.newtaskOnPressed(context),
            icon: Icon(Icons.add_circle_outline, size: 40),
            label: 'New task',
          ),
          _buildButton(
            onPressed: () => _presenter.newtaskOnPressed(context),
            icon: Icon(Icons.history, size: 40),
            label: 'Log',
          ),
          _buildButton(
            onPressed: _isConnected ? null : () => _presenter.serverOnPressed(context),
            icon: Icon(_isConnected ? Icons.sensors : Icons.sensors_off, size: 40),
            label: 'Server',
          ),
        ],
      ),
    );
  }

  Widget _buildButton({VoidCallback? onPressed, required Icon icon, required String label}) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: MyTextStyle.weather,
        ),
      ],
    );
  }

  @override
  void setStatus(bool status) {
    setState(() {
      _isConnected = status;
    });
  }
}
