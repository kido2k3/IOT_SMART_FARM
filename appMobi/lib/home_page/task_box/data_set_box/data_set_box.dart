import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../tool_bar/tool_bar_presenter.dart';
import '../../tool_bar/tool_bar_view.dart';
import '../task_box_view.dart';

class DataSetBox extends StatefulWidget {
  const DataSetBox({super.key});

  @override
  State<DataSetBox> createState() => _DataSetBoxState();
}

class _DataSetBoxState extends State<DataSetBox> implements TaskBoxView, ToolBarView {
  late ToolBarPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = toolBarPresenter;
    _presenter.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _presenter.DataSet.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.915,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8999999761581421),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '\t \t Name: ${_presenter.DataSet[index]['Name']} \n'
                              '\t \t Area: ${_presenter.DataSet[index]['Area']} \n'
                              '\t \t Concentration of 1st fertilizer: ${_presenter.DataSet[index]['Concentration of 1st fertilizer']} \n'
                              '\t \t Concentration of 2nd fertilizer: ${_presenter.DataSet[index]['Concentration of 2nd fertilizer']} \n'
                              '\t \t Concentration of 3rd fertilizer: ${_presenter.DataSet[index]['Concentration of 3rd fertilizer']} \n'
                              '\t \t Cycle: ${_presenter.DataSet[index]['Cycle']} \n'
                              '\t \t Start Time: ${_presenter.DataSet[index]['Start Time']} \n'
                              '\t \t Stop Time: ${_presenter.DataSet[index]['Stop Time']}',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.475),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _presenter.DataSet.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.cancel_outlined),
                          color: Colors.red,
                          iconSize: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }

  @override
  void setStatus(bool status) {
  }
}
