

import 'package:flutter/material.dart';

import 'light_intensity_presenter.dart';
import 'light_intensity_view.dart';



class LightIntensity extends StatefulWidget {
  const LightIntensity({super.key});

  @override
  State<LightIntensity> createState() => _LightIntensityState();
}

class _LightIntensityState extends State<LightIntensity> implements LightIntensityView {
  double _value = 0;
  late LightIntensityPresenter _presenter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("$_value lx",
          style: const TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 30),
          textAlign: TextAlign.center
      ),

    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = lightIntensityPresenter;
    _presenter.attachView(this);
    _presenter.getValue();
  }

  @override
  void updateData(double value) {
    // TODO: implement updateData
    setState(() {
      _value = value;
    });
  }

  @override
  void onFailUpdate() {
    // TODO: implement onFailUpdate
    setState(() {
      _value = -99;
    });
  }
}