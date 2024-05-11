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
  late ToolBarPresenter _presenter;
  bool isUser = true;

  @override
  void initState() {
    super.initState();
    _presenter = toolBarPresenter;
    _presenter.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.15),
        shape: BoxShape.rectangle,
        border: Border(
          top: BorderSide(width: 1, color: Colors.white.withOpacity(0.25)),
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: Row(
          children: [
            // _buildButton(
            //   onPressed: () => _presenter.newtaskOnPressed(context),
            //   icon: Icon(Icons.history, size: 40),
            //   label: 'Log',
            // ),
            Expanded(
              flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0),
                    shape: BoxShape.rectangle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isUser = !isUser;
                      });
                    },
                    icon: isUser ? Icon(Icons.person_outline_outlined, color: Colors.white, size: 40) :
                    Text('Pham Tien Dat',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 27,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

            ),
            Expanded(
              flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: _buildButton(
                    onPressed: _presenter.isConnected ? null : () => _presenter.serverOnPressed(context),
                    icon: Icon(_presenter.isConnected ? Icons.sensors : Icons.sensors_off, size: 40, color: Colors.white),
                  ),
                ),

            ),
          ],
        ),
    );
  }

  Widget _buildButton({VoidCallback? onPressed, required Icon icon}) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
        // Text(
        //   label,
        //   textAlign: TextAlign.center,
        //   style: MyTextStyle.weather,
        // ),
      ],
    );
  }

  @override
  void setStatus(bool status) {
    setState(() {
      _presenter.isConnected = status;
    });
  }
}
