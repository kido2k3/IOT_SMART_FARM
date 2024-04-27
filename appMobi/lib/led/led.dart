

import 'package:flutter/material.dart';

import 'led_presenter.dart';
import 'led_view.dart';

class Led extends StatefulWidget {
  const Led({super.key});

  @override
  State<Led> createState() => _LedState();
}

class _LedState extends State<Led> implements LedView {
  bool _led = false;
  late LedPresenter _presenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = ledPresenter;
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
        value: _led,
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
      _led = value;
    });
    _presenter.publish(value);
  }

  @override
  void onFailUpdate() {
    // TODO: implement onFailUpdate
    setState(() {
      _led = false;
    });
  }

  @override
  void updateBool(bool value) {
    // TODO: implement updateBool
    setState(() {
      _led = value;
    });
  }
}
