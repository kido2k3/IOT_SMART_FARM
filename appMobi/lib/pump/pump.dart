import 'package:app_mobi/pump/pump_presenter.dart';
import 'package:app_mobi/pump/pump_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pump extends StatefulWidget {
  const Pump({super.key});

  @override
  State<Pump> createState() => _PumpState();
}

class _PumpState extends State<Pump> implements PumpView {
  bool _pump = false;
  late PumpPresenter _presenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = pumpPresenter;
    _presenter.attachView(this);
    _presenter.getValue();
  }
  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Track color when the switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.amber;
        }
        // Otherwise return null to set default track color
        // for remaining states such as when the switch is
        // hovered, focused, or disabled.
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Material color when switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.amber.withOpacity(0.54);
        }
        // Material color when switch is disabled.
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        // Otherwise return null to set default material color
        // for remaining states such as when the switch is
        // hovered, or focused.
        return null;
      },
    );
    return Transform.scale(
      scale: 3.0,
      child: Switch(
        // This bool value toggles the switch.
        value: _pump,
        overlayColor: overlayColor,
        trackColor: trackColor,
        thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
        onChanged: onChanged,
      ),
    );
  }

  void onChanged(bool value) {
    // This is called when the user toggles the switch.
    setState(() {
      _pump = value;
    });
    _presenter.publish(value);
  }

  @override
  void onFailUpdate() {
    // TODO: implement onFailUpdate
    setState(() {
      _pump = false;
    });
  }

  @override
  void updateBool(bool value) {
    // TODO: implement updateBool
    setState(() {
      _pump = value;
    });
  }
}
